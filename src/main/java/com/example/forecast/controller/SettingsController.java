package com.example.forecast.controller;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/settings")
public class SettingsController {

    private final UserRepository userRepository;

    public SettingsController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

@GetMapping("/users")
public String userList(Model model) {
    List<User> users = userRepository.findAllByOrderByUserIdAsc(); // ← 変更
    model.addAttribute("users", users);
    return "users_list";
}
@PostMapping("/users/update")
public String updateUserRoleConfirmed(
        @RequestParam int userId,
        @RequestParam String role
) {
    userRepository.findById(userId).ifPresent(user -> {
        user.setRole(role);
        userRepository.save(user);
    });
    return "redirect:/settings/users";
}

}
