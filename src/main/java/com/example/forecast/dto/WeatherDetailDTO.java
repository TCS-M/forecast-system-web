package com.example.forecast.dto;

import java.util.Map;

public class WeatherDetailDTO {
    private String date;
    private String weather;
    private Map<String, Integer> productSales; // 製品名 → 売上本数

    public WeatherDetailDTO(String date, String weather, Map<String, Integer> productSales) {
        this.date = date;
        this.weather = weather;
        this.productSales = productSales;
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
}

