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

    // 🔹ユーザー用の一覧ページ
    @GetMapping("/user-list")
    public String showUserWeather(Model model) {
        List<WeatherData> weatherList = weatherService.getWeatherWithSales();
        model.addAttribute("weatherList", weatherList);
        model.addAttribute("source", "user");  // 遷移元識別用
        return "user_data_detail"; // templates/user_data_detail.html
    }

    // 🔹管理者用の一覧ページ
    @GetMapping("/admin-list")
    public String showAdminWeather(Model model) {
        List<WeatherData> weatherList = weatherService.getWeatherWithSales();
        model.addAttribute("weatherList", weatherList);
        model.addAttribute("source", "admin");  // 遷移元識別用
        return "admin_data_detail"; // templates/admin_data_detail.html
    }

    // 🔸詳細ページ（共通） ※source付きで遷移すること
    @GetMapping("/detail")
    public String showDetail(@RequestParam("date") String date,
                             @RequestParam("source") String source,
                             Model model) {
        try {
            logger.info("📌 詳細ページ遷移処理開始：date={}, source={}", date, source);

            WeatherDetailDTO detail = weatherService.getDetailByDate(date);

            if (detail == null || detail.isEmpty()) {
                logger.warn("⚠️ WeatherDetailDTO が null または中身が空です：date={}", date);
                throw new RuntimeException("指定された日付の天気または販売データが存在しません。");
            }

            logger.info("✅ DTO取得成功：天気={}, 製品数={}", detail.getWeather(), detail.getProductSales().size());

            model.addAttribute("detail", detail);
            model.addAttribute("source", source); // 戻るボタンに使用
            return "weather_detail"; // templates/weather_detail.html

        } catch (Exception e) {
            logger.error("❌ 詳細ページの取得中にエラーが発生しました：{}", e.getMessage(), e);
            throw e;
        }
    }
}

