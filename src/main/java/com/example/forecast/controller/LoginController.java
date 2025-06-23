package com.example.forecast.controller;

import com.example.forecast.model.User;
import com.example.forecast.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() { return "login"; }

    @GetMapping("/login")
    public String loginPage() { return "login"; }

    // @GetMapping("/admin_login")
    // public String adminLoginPage() { return "admin_login"; }

    @PostMapping("/login")
    public String login(@RequestParam String identifier,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        if (userService.authenticate(identifier, password)) {
            User user = userService.getUserByIdentifier(identifier).get();
            session.setAttribute("loggedInUser", user);
            return "redirect:/user_homepage";
        }
        model.addAttribute("loginError", "ユーザー名/メールアドレスまたはパスワードが正しくありません");
        return "login";
    }

    // @PostMapping("/admin_login")
    // public String adminLogin(@RequestParam String identifier,
    //                          @RequestParam String password,
    //                          HttpSession session,
    //                          Model model) {
    //     if (userService.authenticate(identifier, password)) {
    //         User user = userService.getUserByIdentifier(identifier).get();
    //         if ("admin".equals(user.getRole())) {
    //             session.setAttribute("loggedInUser", user);
    //             return "redirect:/admin_homepage";
    //         }
    //     }
    //     model.addAttribute("loginError", "ユーザー名/メールアドレスまたはパスワードが正しくありません");
    //     return "admin_login";
    // }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
