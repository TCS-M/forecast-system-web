package com.example.forecast.dto;

public class WeatherDto {
    private String date;
    private double temp;
    private double humidity;
    private double wind_speed;
    private double rain;


     public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public double getTemp() { return temp; }
    public void setTemp(double temp) { this.temp = temp; }

    public double getHumidity() { return humidity; }
    public void setHumidity(double humidity) { this.humidity = humidity; }

    public double getWind_speed() { return wind_speed; }
    public void setWind_speed(double wind_speed) { this.wind_speed = wind_speed; }

    public double getRain() { return rain; }
    public void setRain(double rain) { this.rain = rain; }
}
