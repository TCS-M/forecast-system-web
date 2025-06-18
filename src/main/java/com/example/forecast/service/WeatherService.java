package com.example.forecast.service;

import com.example.forecast.dto.WeatherDetailDTO;
import com.example.forecast.model.WeatherData;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.*;

@Service
public class WeatherService {

    @PersistenceContext
    private EntityManager entityManager;

    // 一覧表示用：日付・天気・販売本数の取得
    public List<WeatherData> getWeatherWithSales() {
        String sql = """
                SELECT w.weather_date, w.weather_info, 
                       COALESCE(SUM(s.quantity), 0) AS total_sales
                FROM weather w
                LEFT JOIN sales s ON w.weather_date = s.sale_date
                GROUP BY w.weather_date, w.weather_info
                ORDER BY w.weather_date;
                """;

        Query query = entityManager.createNativeQuery(sql);
        List<Object[]> results = query.getResultList();

        List<WeatherData> dataList = new ArrayList<>();
        for (Object[] row : results) {
            Date sqlDate = (Date) row[0];
            String weather = (String) row[1];
            Number sales = (Number) row[2];

            WeatherData data = new WeatherData(
                sqlDate,
                weather,
                sales != null ? sales.intValue() : 0
            );
            dataList.add(data);
        }
        return dataList;
    }

    // 詳細ページ用：指定日付の天気 + 製品別販売数を取得
    public WeatherDetailDTO getDetailByDate(String date) {
        // 製品別売上
        String sql = """
            SELECT p.name, COALESCE(SUM(s.quantity), 0)
            FROM products p
            LEFT JOIN sales s ON p.product_id = s.product_id AND s.sale_date = :date
            GROUP BY p.name
            ORDER BY p.name;
        """;

        Query query = entityManager.createNativeQuery(sql);
        query.setParameter("date", Date.valueOf(date));
        List<Object[]> results = query.getResultList();

        Map<String, Integer> salesMap = new LinkedHashMap<>();
        for (Object[] row : results) {
            String name = (String) row[0];
            Number qty = (Number) row[1];
            salesMap.put(name, qty != null ? qty.intValue() : 0);
        }

        // 天気情報の詳細取得
        String weatherSql = """
            SELECT weather_info, weather_water, weather_wind, weather_temperature
            FROM weather
            WHERE weather_date = :date
        """;
        Query weatherQuery = entityManager.createNativeQuery(weatherSql);
        weatherQuery.setParameter("date", Date.valueOf(date));
        List<Object[]> weatherResults = weatherQuery.getResultList();

        String weatherInfo = "不明";
        Double water = null;
        Double wind = null;
        Double temp = null;

        if (!weatherResults.isEmpty()) {
            Object[] row = weatherResults.get(0);
            weatherInfo = (String) row[0];
            water = row[1] != null ? ((Number) row[1]).doubleValue() : null;
            wind = row[2] != null ? ((Number) row[2]).doubleValue() : null;
            temp = row[3] != null ? ((Number) row[3]).doubleValue() : null;
        }

        return new WeatherDetailDTO(date, weatherInfo, salesMap, water, wind, temp);
    }
}
