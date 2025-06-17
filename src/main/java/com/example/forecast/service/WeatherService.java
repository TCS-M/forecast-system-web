package com.example.forecast.service;

import com.example.forecast.model.WeatherData;
import com.example.forecast.repository.WeatherDataRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WeatherService {

    private final WeatherDataRepository repository;

    public WeatherService(WeatherDataRepository repository) {
        this.repository = repository;
    }

    public List<WeatherData> getWeeklyWeather() {
        return repository.findAll(); // 絞り込みしたければここで加工
    }
}


