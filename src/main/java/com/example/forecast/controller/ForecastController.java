package com.example.forecast.controller;

import com.example.forecast.model.Forecast;
import com.example.forecast.service.ForecastService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/forecast")
public class ForecastController {

    @Autowired
    private ForecastService forecastService;

    @GetMapping
    public String showForecast(@RequestParam(value = "forecastDate", required = false)
                            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate forecastDate,
                            Model model) {
        List<Forecast> forecasts;
        if (forecastDate != null) {
            forecasts = forecastService.getForecastByDate(forecastDate);
            model.addAttribute("selectedDate", forecastDate);
        } else {
            forecasts = forecastService.getOrderForecasts();
        }
        model.addAttribute("forecasts", forecasts);
        return "user_forecast_list";
    }

}
