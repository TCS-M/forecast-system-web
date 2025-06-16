package com.example.forecast.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // templates/login.html を表示
    }

    @PostMapping("/login")
    public String processLogin(String username, String password) {
        // 認証処理をここに記述（仮にログイン成功とする）
        return "redirect:/dashboard";
    }
}
