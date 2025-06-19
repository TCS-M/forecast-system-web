package com.example.forecast.service;

import com.example.forecast.dto.WeatherDetailDTO;
import com.example.forecast.model.WeatherData;
import com.example.forecast.repository.WeatherDataRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class WeatherService {

    private final WeatherDataRepository weatherDataRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public WeatherService(WeatherDataRepository weatherDataRepository) {
        this.weatherDataRepository = weatherDataRepository;
    }

    public List<WeatherData> getWeatherWithSales() {
        List<WeatherData> list = weatherDataRepository.findAll();
        for (WeatherData data : list) {
            Integer totalSales = getTotalSalesByDate(data.getWeatherDate());
            data.setTotalSales(totalSales);
        }
        return list;
    }

    public Integer getTotalSalesByDate(Date date) {
        String jpql = "SELECT SUM(s.quantity) FROM sales s WHERE s.sale_date = :targetDate";
        Number total = (Number) entityManager.createNativeQuery(jpql)
                .setParameter("targetDate", date)
                .getSingleResult();
        return total != null ? total.intValue() : 0;
    }

    @Transactional
    public WeatherDetailDTO getDetailByDate(String dateStr) {
        LocalDate targetDate = LocalDate.parse(dateStr);
        Date sqlDate = Date.valueOf(targetDate);

        // 天気データ取得
        Object[] weatherRow = (Object[]) entityManager.createNativeQuery(
            "SELECT weather_info, weather_water, weather_wind, weather_temperature " +
            "FROM weather WHERE weather_date = :date"
        ).setParameter("date", sqlDate).getSingleResult();

        String weather = (String) weatherRow[0];
        Double water = weatherRow[1] != null ? ((Number) weatherRow[1]).doubleValue() : null;
        Double wind = weatherRow[2] != null ? ((Number) weatherRow[2]).doubleValue() : null;
        Double temp = weatherRow[3] != null ? ((Number) weatherRow[3]).doubleValue() : null;

        // 売上データ取得
        List<Object[]> salesResult = entityManager.createNativeQuery(
            "SELECT p.name, SUM(s.quantity) " +
            "FROM sales s JOIN products p ON s.product_id = p.product_id " +
            "WHERE s.sale_date = :date GROUP BY p.name"
        ).setParameter("date", sqlDate).getResultList();

        Map<String, Integer> productSales = new LinkedHashMap<>();
        for (Object[] row : salesResult) {
            productSales.put((String) row[0], ((Number) row[1]).intValue());
        }

        // 在庫数の計算：選択日から15日前～前日までの販売数を差し引く
        LocalDate startDate = targetDate.minusDays(15);
        LocalDate endDate = targetDate.minusDays(1);

        List<Object[]> stockResult = entityManager.createNativeQuery(
            "SELECT p.name, p.stock_quantity, COALESCE(SUM(s.quantity), 0) " +
            "FROM products p " +
            "LEFT JOIN sales s ON p.product_id = s.product_id AND s.sale_date BETWEEN :start AND :end " +
            "GROUP BY p.name, p.stock_quantity"
        ).setParameter("start", Date.valueOf(startDate))
         .setParameter("end", Date.valueOf(endDate))
         .getResultList();

        Map<String, Integer> productStock = new LinkedHashMap<>();
        for (Object[] row : stockResult) {
            String name = (String) row[0];
            int initialStock = ((Number) row[1]).intValue();
            int sales = ((Number) row[2]).intValue();
            productStock.put(name, initialStock - sales);
        }

        return new WeatherDetailDTO(dateStr, weather, productSales, water, wind, temp, productStock);
    }
}


