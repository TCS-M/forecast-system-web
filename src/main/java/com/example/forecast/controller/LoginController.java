package com.example.forecast.controller;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
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

    @PostMapping("/login")
    public String login(@RequestParam("username") String email,
                        @RequestParam("password") String password,
                        HttpSession session) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            // ⚠️ 暂时使用明文密码比较（正式请用 BCrypt）
            if (user.getPassword().equals(password)) {
                session.setAttribute("loggedInUser", user);
                return "redirect:/dashboard";
            }
        }

        // 登录失败，返回登录页面
        return "login";
    }
}
