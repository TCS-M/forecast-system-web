package com.example.forecast.service;

import com.example.forecast.model.WeatherData;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import com.example.forecast.dto.WeatherDetailDTO;
import java.util.HashMap;
import java.util.Map;

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

    
    public WeatherDetailDTO getDetailByDate(String date) {
    // 売上取得
    String sql = """
        SELECT p.name, COALESCE(SUM(s.quantity), 0)
        FROM products p
        LEFT JOIN sales s ON p.product_id = s.product_id AND s.sale_date = :date
        GROUP BY p.name
        ORDER BY p.name;
    """;
    Query query = entityManager.createNativeQuery(sql);
    query.setParameter("date", java.sql.Date.valueOf(date));
    List<Object[]> results = query.getResultList();

    Map<String, Integer> salesMap = new HashMap<>();
    for (Object[] row : results) {
        String name = (String) row[0];
        Number qty = (Number) row[1];
        salesMap.put(name, qty != null ? qty.intValue() : 0);
    }

    // 天気取得（null対応）
    String weatherSql = "SELECT weather_info FROM weather WHERE weather_date = :date";
    Query weatherQuery = entityManager.createNativeQuery(weatherSql);
    weatherQuery.setParameter("date", java.sql.Date.valueOf(date));
    List<String> weatherResult = weatherQuery.getResultList();
    String weather = weatherResult.isEmpty() ? "不明" : weatherResult.get(0);

    return new WeatherDetailDTO(date, weather, salesMap);
}

}
