//ログイン後のユーザーホーム画面への遷移を管理するコントローラーです。
package com.example.forecast.controller;
import com.example.forecast.model.Product;
import com.example.forecast.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class User_homepageController {

    @GetMapping("/user_homepage")
    public String userHomepage(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        return "user_homepage";
    }

}


