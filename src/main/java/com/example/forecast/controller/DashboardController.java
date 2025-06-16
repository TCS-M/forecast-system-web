package com.example.forecast.controller;

import com.example.forecast.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login"; // 未登录，重定向回登录页
        }

        model.addAttribute("username", user.getName());
        return "dashboard";  // 显示 dashboard.html
    }
}
