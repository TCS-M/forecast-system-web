package com.example.forecast.controller;

import com.example.forecast.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomepageController {

    @GetMapping("/admin_homepage")
    public String adminHomepage(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        return "admin_homepage";
    }
    @GetMapping("/users_list")
    public String showUsers() {
        return "users_list";
    }   

}
