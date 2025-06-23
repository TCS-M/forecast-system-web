package com.example.forecast.dto;

import java.util.Map;

public class WeatherDetailDTO {
    private String date;
    private String weather;
    private Map<String, Integer> productSales;
    private Double water;
    private Double wind;
    private Double temperature;

    // 製品別在庫情報（追加）
    private Map<String, Integer> productStock;

    public WeatherDetailDTO(String date, String weather, Map<String, Integer> productSales,
            Double water, Double wind, Double temperature,
            Map<String, Integer> productStock) {
        this.date = date;
        this.weather = weather;
        this.productSales = productSales;
        this.water = water;
        this.wind = wind;
        this.temperature = temperature;
        this.productStock = productStock;
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

    public Map<String, Integer> getProductStock() {
        return productStock;
    }

    public boolean isEmpty() {
        return (productSales == null || productSales.isEmpty()) &&
                (productStock == null || productStock.isEmpty()) &&
                (weather == null || weather.isBlank()) &&
                water == null && wind == null && temperature == null;
    }
}
