package com.example.forecast.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Column;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

import java.io.Serializable;
import java.sql.Date;

@Entity
@Table(name = "weather")
public class WeatherData implements Serializable {

    @Id
    @Column(name = "weather_date")
    private Date weatherDate;

    @Column(name = "weather_info")
    private String weatherInfo;

    @Transient // DBには存在しないが画面表示などで使いたい
    private Integer totalSales;

    public WeatherData() {
    }

    public WeatherData(Date weatherDate, String weatherInfo, Integer totalSales) {
        this.weatherDate = weatherDate;
        this.weatherInfo = weatherInfo;
        this.totalSales = totalSales;
    }

    public Date getWeatherDate() {
        return weatherDate;
    }

    public void setWeatherDate(Date weatherDate) {
        this.weatherDate = weatherDate;
    }

    public String getWeatherInfo() {
        return weatherInfo;
    }

    public void setWeatherInfo(String weatherInfo) {
        this.weatherInfo = weatherInfo;
    }

    public Integer getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(Integer totalSales) {
        this.totalSales = totalSales;
    }
}
