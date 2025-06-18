package com.example.forecast.controller;

import com.example.forecast.model.WeatherData;
import com.example.forecast.service.WeatherService;
import com.example.forecast.dto.WeatherDetailDTO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        List<WeatherData> weatherList = weatherService.getWeatherWithSales();
        model.addAttribute("weatherList", weatherList);
        return "data_detail"; // templates/data_detail.html
    }

    @GetMapping("/detail")
    public String showDetail(@RequestParam("date") String date, Model model) {
        WeatherDetailDTO detail = weatherService.getDetailByDate(date);
        model.addAttribute("detail", detail);
        return "weather_detail"; // templates/weather_detail.html
}

}
