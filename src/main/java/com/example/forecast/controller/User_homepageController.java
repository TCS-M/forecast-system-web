package com.example.forecast.controller;

import com.example.forecast.model.Forecast;
import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import com.example.forecast.service.ProductService;
import com.example.forecast.service.ForecastService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;

@Controller
public class User_homepageController {

    private final UserRepository userRepository;
    private final ProductService productService;
    private final ForecastService forecastService;

    // コンストラクタでまとめて注入
    @Autowired
    public User_homepageController(UserRepository userRepository, ProductService productService,
            ForecastService forecastService) {
        this.userRepository = userRepository;
        this.productService = productService;
        this.forecastService = forecastService;
    }

    @GetMapping("/user_homepage")
    public String userHomepage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String emailOrId = auth.getName();
        User user = userRepository.findByEmailAndIsDeletedFalse(emailOrId)
                .orElseGet(() -> userRepository.findByNameAndIsDeletedFalse(emailOrId).orElse(null));
        if (user != null) {
            model.addAttribute("username", user.getName());
        } else {
            model.addAttribute("username", emailOrId);
        }
        return "user_homepage";
    }

    // 天気と販売詳細ページ
    @GetMapping("/weather_detail")
    public String weatherDetail(@RequestParam("date") String date, Model model) {
        model.addAttribute("detail", new Object());
        return "weather_detail";
    }

    // ユーザー予測一覧
    @GetMapping("/user_forecast")
    public String showUserForecastList(Model model) {
        List<Forecast> forecasts = forecastService.getOrderForecasts();
        model.addAttribute("forecasts", forecasts);
        return "user_forecast_list";
    }

    // 発注ページ
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
