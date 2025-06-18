package com.example.forecast.controller;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class User_homepageController {

    private final UserRepository userRepository;

    public User_homepageController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/user_homepage")
    public String userHomepage(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        return "user_homepage";
    }
    @GetMapping("/user/new")
    public String showUserForm() {
        return "user_form";  // user_form.html を表示
    }

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
        userRepository.save(user);
        return "redirect:/settings/users";
    }
}

