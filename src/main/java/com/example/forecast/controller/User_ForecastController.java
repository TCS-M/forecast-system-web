package com.example.forecast.controller;

import com.example.forecast.service.ForecastService;
import com.example.forecast.model.Forecast;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class User_ForecastController {

    private final ForecastService forecastService;

    // @Autowired 推奨（今のままでもOKですが明示すると可読性UP）
    public User_ForecastController(ForecastService forecastService) {
        this.forecastService = forecastService;
    }

    // ユーザー向け予測一覧
    @GetMapping("/forecast")
    public String showForecast(Model model) throws Exception {
        // ここでDB→なければAPI取得・保存
        List<Forecast> forecasts = forecastService.getForecasts();
        model.addAttribute("forecasts", forecasts);
        return "user_forecast_list"; // ←このHTMLに渡す
    }
}
