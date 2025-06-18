package com.example.forecast.controller;

import com.example.forecast.model.Forecast;
import com.example.forecast.service.ForecastService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/forecast")
public class ForecastController {

    @Autowired
    private ForecastService forecastService;

    @GetMapping
    public String showForecast(Model model) {
        List<Forecast> forecasts = forecastService.getOrderForecasts();
        model.addAttribute("forecasts", forecasts);
        return "user_forecast_list";
    }
}
