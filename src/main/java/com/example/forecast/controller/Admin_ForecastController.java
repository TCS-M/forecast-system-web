package com.example.forecast.controller;

import com.example.forecast.dto.ForecastDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class Admin_ForecastController {

    private final String API_URL = "https://forecast-beer.azurewebsites.net/forecast";

    @GetMapping("/forecast")
    public String showForecast(Model model) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        String json = restTemplate.getForObject(API_URL, String.class);

        // "predictions" 配列だけを抽出
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(json);
        JsonNode predictionsNode = rootNode.path("predictions");

        ForecastDto[] forecastArray = mapper.treeToValue(predictionsNode, ForecastDto[].class);
        List<ForecastDto> forecasts = Arrays.asList(forecastArray);

        model.addAttribute("forecasts", forecasts);
        return "admin_forecast_list";
    }
}
