package com.example.forecast.service;

import com.example.forecast.dto.WeatherDetailDTO;
import com.example.forecast.model.WeatherData;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.repository.WeatherDataRepository;
import com.example.forecast.repository.SalesRecordRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

@Service
public class WeatherService {

    @Autowired
    private WeatherDataRepository weatherDataRepository;

    @Autowired
    private SalesRecordRepository salesRecordRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public List<WeatherData> getWeatherWithSales() {
        List<WeatherData> weatherList = weatherDataRepository.findAll();

        for (WeatherData weather : weatherList) {
            Date date = weather.getWeatherDate();
            LocalDate localDate = date.toLocalDate();

            int totalSales = salesRecordRepository.findBySaleDateWithUserAndProduct(localDate)
                    .stream()
                    .mapToInt(SalesRecord::getQuantity)
                    .sum();

            weather.setTotalSales(totalSales);
        }

        return weatherList.stream()
                .sorted(Comparator.comparing(WeatherData::getWeatherDate).reversed())
                .toList();
    }

    @Transactional
    public WeatherDetailDTO getDetailByDate(String dateStr) {
        try {
            LocalDate targetDate = LocalDate.parse(dateStr);
            Date sqlDate = Date.valueOf(targetDate);

            // 天気データ取得
            WeatherData weatherData = weatherDataRepository.findById(sqlDate).orElse(null);
            String weatherInfo = (weatherData != null) ? weatherData.getWeatherInfo() : null;
            Double water = (weatherData != null) ? weatherData.getWater() : null;
            Double wind = (weatherData != null) ? weatherData.getWind() : null;
            Double temperature = (weatherData != null) ? weatherData.getTemperature() : null;

            // 売上データ取得
            List<SalesRecord> salesRecords = salesRecordRepository.findBySaleDateWithUserAndProduct(targetDate);
            Map<String, Integer> productSales = new HashMap<>();
            for (SalesRecord record : salesRecords) {
                String productName = record.getProduct().getName();
                productSales.put(productName,
                        productSales.getOrDefault(productName, 0) + record.getQuantity());
            }

            // 在庫数の計算：選択日から15日前～前日までの販売数を差し引く
            LocalDate startDate = targetDate.minusDays(15);
            LocalDate endDate = targetDate.minusDays(1);

            // ✅ 新しい登録データ（sales_form 由来）
            List<Object[]> newStock = entityManager.createNativeQuery(
                    "SELECT p.name, SUM(p.stock_quantity), COALESCE(SUM(s.quantity), 0) " +
                    "FROM products p " +
                    "LEFT JOIN sales s ON p.product_id = s.product_id AND s.sale_date BETWEEN :start AND :end " +
                    "WHERE p.expiration_date = p.production_date + INTERVAL '15 days' " +
                    "AND p.expiration_date >= :target " +
                    "GROUP BY p.name"
            )
            .setParameter("start", Date.valueOf(startDate))
            .setParameter("end", Date.valueOf(endDate))
            .setParameter("target", Date.valueOf(targetDate))
            .getResultList();

            // ✅ 過去データ（それ以外）
            List<Object[]> oldStock = entityManager.createNativeQuery(
                    "SELECT p.name, SUM(p.stock_quantity), COALESCE(SUM(s.quantity), 0) " +
                    "FROM products p " +
                    "LEFT JOIN sales s ON p.product_id = s.product_id AND s.sale_date BETWEEN :start AND :end " +
                    "WHERE (p.expiration_date IS NULL OR p.expiration_date != p.production_date + INTERVAL '15 days') " +
                    "AND p.expiration_date >= :target " +
                    "GROUP BY p.name"
            )
            .setParameter("start", Date.valueOf(startDate))
            .setParameter("end", Date.valueOf(endDate))
            .setParameter("target", Date.valueOf(targetDate))
            .getResultList();

            // マージ処理（同名商品は合算）
            Map<String, Integer> productStock = new LinkedHashMap<>();
            for (Object[] row : oldStock) {
                String name = (String) row[0];
                int stock = ((Number) row[1]).intValue();
                int sales = ((Number) row[2]).intValue();
                productStock.put(name, stock - sales);
            }
            for (Object[] row : newStock) {
                String name = (String) row[0];
                int stock = ((Number) row[1]).intValue();
                int sales = ((Number) row[2]).intValue();
                productStock.merge(name, stock - sales, Integer::sum);
            }

            return new WeatherDetailDTO(
                    dateStr,
                    weatherInfo,
                    productSales,
                    water,
                    wind,
                    temperature,
                    productStock);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
