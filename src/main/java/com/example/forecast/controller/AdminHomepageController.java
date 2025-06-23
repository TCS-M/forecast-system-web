package com.example.forecast.controller;

import com.example.forecast.model.Forecast;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import com.example.forecast.service.ForecastService;
import com.example.forecast.service.SalesRecordService;
import com.example.forecast.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class AdminHomepageController {

    private final UserRepository userRepository;
    private final UserService userService;
    private final ForecastService forecastService;
    private final SalesRecordService salesRecordService;

    @Autowired
    public AdminHomepageController(
        UserRepository userRepository,
        UserService userService,
        ForecastService forecastService,
        SalesRecordService salesRecordService
    ) {
        this.userRepository = userRepository;
        this.userService = userService;
        this.forecastService = forecastService;
        this.salesRecordService = salesRecordService;
    }

    // 管理者ホーム画面
    @GetMapping("/admin_homepage")
    public String adminHomepage(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String emailOrId = auth.getName();
        // email or nameでDB検索
        User user = userRepository.findByEmailAndIsDeletedFalse(emailOrId)
                .orElseGet(() -> userRepository.findByNameAndIsDeletedFalse(emailOrId).orElse(null));
        if (user != null) {
            model.addAttribute("username", user.getName());
        } else {
            model.addAttribute("username", emailOrId);
        }
        return "admin_homepage";
    }

    // ユーザー一覧
    @GetMapping("/users_list")
    public String showUsers() {
        return "users_list";
    }

    // ユーザー新規登録フォーム
    @GetMapping("/user/new")
    public String showUserForm() {
        return "user_form";
    }

    // ユーザー保存
    @PostMapping("/user/save")
    public String saveUser(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role
    ) {
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        user.setIsDeleted(false);
        userService.saveUser(user); // パスワード暗号化込み
        return "redirect:/settings/users";
    }

    // ユーザー編集フォーム
    @GetMapping("/settings/users/edit/{id}")
    public String showEditForm(@PathVariable("id") Integer id, Model model) {
        Optional<User> userOpt = userRepository.findById(id);
        if (userOpt.isPresent()) {
            model.addAttribute("user", userOpt.get());
            return "user_edit";
        } else {
            return "redirect:/settings/users";
        }
    }

    // 予測一覧
    @GetMapping("/admin_forecast")
    public String showAdminForecastList(Model model) {
        List<Forecast> forecasts = forecastService.getOrderForecasts();
        model.addAttribute("forecasts", forecasts);
        return "admin_forecast_list";
    }

    // ユーザー一括更新
    @PostMapping("/settings/users/allupdate")
    public String updateUser(
            @RequestParam Integer userId,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String role,
            @RequestParam(required = false) String password) {

        Optional<User> userOpt = userRepository.findById(userId);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            user.setName(name);
            user.setEmail(email);
            user.setRole(role);

            if (password != null && !password.isBlank()) {
                user.setPassword(password);
                userService.saveUser(user); // パスワード暗号化込み
            } else {
                userRepository.save(user);
            }
        }
        return "redirect:/settings/users";
    }

    // ユーザー削除（論理削除）
    @PostMapping("/settings/users/delete")
    public String deleteUser(@RequestParam Integer userId) {
        userRepository.findById(userId).ifPresent(user -> {
            user.setIsDeleted(true);
            userRepository.save(user);
        });
        return "redirect:/settings/users";
    }

    // 売上一覧（サブコントローラーでなくメソッドとして）
    @GetMapping("/admin/sales/list")
    public String showSalesList(Model model) {
        List<SalesRecord> records = salesRecordService.findAllWithUserAndProduct();
        model.addAttribute("records", records);
        return "admin_sales_list";
    }
}
