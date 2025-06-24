package com.example.forecast.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ForecastDto {
    private String date;
    private String weekday;
    private WeatherDto weather;

    @JsonProperty("ホワイトビール")
    private Double whiteBeer;

    @JsonProperty("IPA")
    private Double ipa;

    @JsonProperty("黒ビール")
    private Double blackBeer;

    @JsonProperty("ラガー")
    private Double lager;

    @JsonProperty("フルーツビール")
    private Double fruitBeer;

    @JsonProperty("ペールエール")
    private Double paleAle;

    // --- Getter / Setter ---
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public WeatherDto getWeather() {
        return weather;
    }

    public void setWeather(WeatherDto weather) {
        this.weather = weather;
    }

    public Double getWhiteBeer() {
        return whiteBeer;
    }

    public void setWhiteBeer(Double whiteBeer) {
        this.whiteBeer = whiteBeer;
    }

    public Double getIpa() {
        return ipa;
    }

    public void setIpa(Double ipa) {
        this.ipa = ipa;
    }

    public Double getBlackBeer() {
        return blackBeer;
    }

    public void setBlackBeer(Double blackBeer) {
        this.blackBeer = blackBeer;
    }

    public Double getLager() {
        return lager;
    }

    public void setLager(Double lager) {
        this.lager = lager;
    }

    public Double getFruitBeer() {
        return fruitBeer;
    }

    public void setFruitBeer(Double fruitBeer) {
        this.fruitBeer = fruitBeer;
    }

    public Double getPaleAle() {
        return paleAle;
    }

    public void setPaleAle(Double paleAle) {
        this.paleAle = paleAle;
    }
}
