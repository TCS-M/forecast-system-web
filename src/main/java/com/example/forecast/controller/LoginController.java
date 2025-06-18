//ログイン処理とセッション管理を担当するコントローラーです。
package com.example.forecast.controller;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String home() {
        return "login";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/admin_login")
    public String adminLoginPage() {
        return "admin_login";
    }
    /* 
    @GetMapping("/admin_homepage")
    public String showAdminHomepage() {
        return "admin_homepage";
    }

    @GetMapping("/user_homepage")
    public String showUserHomepage() {
        return "user_homepage";
    }*/
    @PostMapping("/login")
    public String login(@RequestParam("username") String email,
                        @RequestParam("password") String password,
                        HttpSession session) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if (user.getPassword().equals(password)) {
                session.setAttribute("loggedInUser", user);
                return "redirect:/user_homepage";
            }
        }

        return "login";
    }

    @PostMapping("/admin_login")
    public String adminLogin(@RequestParam("email") String email,
                             @RequestParam("password") String password,
                             HttpSession session) {

        System.out.println("★ 管理者ログイン試行中: " + email);

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            System.out.println("★ ユーザー見つかった: " + user.getEmail());
            System.out.println("★ 入力パスワード: " + password);
            System.out.println("★ ユーザーのパスワード: " + user.getPassword());
            System.out.println("★ ロール: " + user.getRole());

            if (user.getPassword().equals(password) && "admin".equals(user.getRole())) {
                session.setAttribute("loggedInUser", user);
                System.out.println("★ 管理者ログイン成功 → /admin_homepage へリダイレクト");
                return "redirect:/admin_homepage";
            } else {
                System.out.println("★ パスワードまたはロール不一致でログイン失敗");
            }
        } else {
            System.out.println("★ ユーザーが存在しない: " + email);
        }

        return "admin_login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
