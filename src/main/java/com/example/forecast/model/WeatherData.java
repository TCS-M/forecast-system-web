package com.example.forecast.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "weather_data")
public class WeatherData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;
    private String weather;
    private double temperature;
    private int salesVolume;

    // ゲッター・セッター省略可（LombokでもOK）
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public String getWeather() { return weather; }
    public void setWeather(String weather) { this.weather = weather; }

    public double getTemperature() { return temperature; }
    public void setTemperature(double temperature) { this.temperature = temperature; }

    public int getSalesVolume() { return salesVolume; }
    public void setSalesVolume(int salesVolume) { this.salesVolume = salesVolume; }
}

