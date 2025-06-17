package com.example.forecast.controller;

import com.example.forecast.model.WeatherData;
import com.example.forecast.service.WeatherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/weather")
public class WeatherController {

    private final WeatherService weatherService;

    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @GetMapping("/list")
    public String showWeather(Model model) {
        List<WeatherData> weatherList = weatherService.getWeeklyWeather();
        model.addAttribute("weatherList", weatherList);
        return "data_detail";
    }
}
