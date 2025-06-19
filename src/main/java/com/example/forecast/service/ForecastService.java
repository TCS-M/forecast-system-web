package com.example.forecast.service;

import com.example.forecast.model.Forecast;
import com.example.forecast.repository.ForecastRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ForecastService {

    @Autowired
    private ForecastRepository forecastRepository;

    public List<Forecast> getForecastByDate(LocalDate date) {
        return forecastRepository.findByForecastDate(date);
    }

    public List<Forecast> getOrderForecasts() {
        return forecastRepository.findByOrderDays(); // 月曜・木曜
    }
}
