package com.example.forecast.dto;

import java.util.Map;

public class WeatherDetailDTO {
    private String date;
    private String weather;
    private Map<String, Integer> productSales;

    // 追加フィールド（天気詳細）
    private Double water;       // 降水量
    private Double wind;        // 風速
    private Double temperature; // 気温

    public WeatherDetailDTO(String date, String weather, Map<String, Integer> productSales,
                            Double water, Double wind, Double temperature) {
        this.date = date;
        this.weather = weather;
        this.productSales = productSales;
        this.water = water;
        this.wind = wind;
        this.temperature = temperature;
    }

    public String getDate() {
        return date;
    }

    public String getWeather() {
        return weather;
    }

    public Map<String, Integer> getProductSales() {
        return productSales;
    }

    public Double getWater() {
        return water;
    }

    public Double getWind() {
        return wind;
    }

    public Double getTemperature() {
        return temperature;
    }

    // WeatherDetailDTO.java に追記
    public boolean isEmpty() {
        return (productSales == null || productSales.isEmpty()) &&
            (weather == null || weather.isBlank()) &&
            water == null && wind == null && temperature == null;
    }

}

