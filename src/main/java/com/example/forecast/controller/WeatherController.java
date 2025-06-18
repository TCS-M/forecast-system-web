package com.example.forecast.controller;

import com.example.forecast.model.WeatherData;
import com.example.forecast.service.WeatherService;
import com.example.forecast.dto.WeatherDetailDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
    private final Logger logger = LoggerFactory.getLogger(WeatherController.class);

    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    // 一覧ページ（/weather/list）
    @GetMapping("/list")
    public String showWeather(Model model) {
        List<WeatherData> weatherList = weatherService.getWeatherWithSales();
        model.addAttribute("weatherList", weatherList);
        return "data_detail"; // templates/data_detail.html
    }

    // 詳細ページ（/weather/detail?date=yyyy-MM-dd）
    @GetMapping("/detail")
    public String showDetail(@RequestParam("date") String date, Model model) {
        try {
            logger.info("📌 詳細ページ遷移処理開始：date={}", date);

            WeatherDetailDTO detail = weatherService.getDetailByDate(date);

            if (detail == null) {
                logger.warn("⚠️ WeatherDetailDTO が null です");
                throw new RuntimeException("WeatherDetailDTO is null");
            }

            logger.info("✅ DTO取得成功：天気={}, 製品数={}", detail.getWeather(), detail.getProductSales().size());

            model.addAttribute("detail", detail);
            return "weather_detail"; // templates/weather_detail.html

        } catch (Exception e) {
            logger.error("❌ 例外発生：{}", e.getMessage(), e);
            throw e; // Springに例外を返してブラウザにエラー表示
        }
    }
}
