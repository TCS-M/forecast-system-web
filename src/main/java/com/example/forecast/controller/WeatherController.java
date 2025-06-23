package com.example.forecast.controller;

import com.example.forecast.model.WeatherData;
import com.example.forecast.service.WeatherService;
import com.example.forecast.service.WeatherApiService;
import com.example.forecast.dto.WeatherDetailDTO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/weather")
public class WeatherController {

    private final WeatherService weatherService;
    private final WeatherApiService weatherApiService; // ← 追加
    private final Logger logger = LoggerFactory.getLogger(WeatherController.class);

    public WeatherController(WeatherService weatherService, WeatherApiService weatherApiService) {
        this.weatherService = weatherService;
        this.weatherApiService = weatherApiService; // ← 追加
    }

    // 🔹ユーザー用の一覧ページ
    @GetMapping("/user-list")
    public String showUserWeather(Model model) {
        List<WeatherData> weatherList = weatherService.getWeatherWithSales();
        model.addAttribute("weatherList", weatherList);
        model.addAttribute("source", "user");  // 遷移元識別用
        return "user_data_detail";
    }

    // 🔹管理者用の一覧ページ（APIから即時取得してDB反映）
    @GetMapping("/admin-list")
    public String showAdminWeather(Model model) {
        logger.info("🔄 外部APIから最新の予測データを取得中...");
        weatherApiService.fetchAndSaveForecastData(); // ← ここで取得＆保存

        List<WeatherData> weatherList = weatherService.getWeatherWithSales();
        model.addAttribute("weatherList", weatherList);
        model.addAttribute("source", "admin");
        return "admin_data_detail";
    }

    // 🔸詳細ページ（共通）
    @GetMapping("/detail")
    public String showDetail(@RequestParam("date") String date,
                             @RequestParam("source") String source,
                             Model model,
                             RedirectAttributes redirectAttributes) {
        try {
            logger.info("📌 詳細ページ遷移処理開始：date={}, source={}", date, source);

            WeatherDetailDTO detail = weatherService.getDetailByDate(date);

            if (detail == null || detail.isEmpty()) {
                logger.warn("⚠️ 該当データなし：date={}", date);
                redirectAttributes.addFlashAttribute("errorMessage", "指定された日付のデータは存在しません。");
                return "redirect:/weather/" + source + "-list";
            }

            model.addAttribute("detail", detail);
            model.addAttribute("source", source);
            return "weather_detail";

        } catch (Exception e) {
            logger.error("❌ エラー発生：{}", e.getMessage(), e);
            redirectAttributes.addFlashAttribute("errorMessage", "エラーが発生しました。");
            return "redirect:/weather/" + source + "-list";
        }
    }
}

