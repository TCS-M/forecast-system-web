// ログイン後のユーザーホーム画面への遷移を管理するコントローラーです。
package com.example.forecast.controller;

import com.example.forecast.model.Forecast;
import com.example.forecast.model.User;
import com.example.forecast.service.ForecastService;

import jakarta.servlet.http.HttpSession;

import com.example.forecast.service.ProductService;
import com.example.forecast.service.ForecastService;


import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class User_homepageController {

    private final ProductService productService;
    private final ForecastService forecastService;

    // ✅ 构造函数：同时注入两个 service
    public User_homepageController(ProductService productService, ForecastService forecastService) {
        this.productService = productService;
        this.forecastService = forecastService;
    }

    // ✅ ユーザーホームページを表示する
    @GetMapping("/user_homepage")
    public String userHomepage(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        return "user_homepage";
    }

    // ✅ 天気と販売詳細ページを表示する
    @GetMapping("/weather_detail")
    public String weatherDetail(@RequestParam("date") String date, Model model) {
        model.addAttribute("detail", new Object()); // 仮データ
        return "weather_detail";
    }

    @Autowired
  private ForecastService forecastService;

    @GetMapping("/user_forecast")
    
    public String showAdminForecastList(Model model) {
        List<Forecast> forecasts = forecastService.getOrderForecasts(); 
        model.addAttribute("forecasts", forecasts);
        return "user_forecast_list";
    }

    // ✅ 発注ページを表示する
    @GetMapping("/order_form")
    public String showOrderForm(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        model.addAttribute("productList", productService.getAllProductsSortedByName());
        model.addAttribute("defaultDate", LocalDate.now());
        return "order_form";
    }
}
