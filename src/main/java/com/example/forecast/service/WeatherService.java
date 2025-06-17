package com.example.forecast.service;

import com.example.forecast.model.WeatherData;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WeatherService {

    @PersistenceContext
    private EntityManager entityManager;

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
            // SQLから取得したデータの変換処理
            java.sql.Date sqlDate = (java.sql.Date) row[0];
            String weather = (String) row[1];
            Number sales = (Number) row[2];

            WeatherData data = new WeatherData(
                sqlDate,         // java.sql.Date → LocalDate に変換
                weather,
                sales != null ? sales.intValue() : 0  // nullチェック
            );
            dataList.add(data);
        }



        return dataList;
    }
}
