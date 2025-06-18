package com.example.forecast.controller;

import java.util.Optional;

import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminHomepageController {

        private final UserRepository userRepository;

    public AdminHomepageController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


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

    @GetMapping("/settings/users/edit/{id}")
public String showEditForm(@PathVariable("id") Integer id, Model model) {
    Optional<User> userOpt = userRepository.findById(id);
    if (userOpt.isPresent()) {
        model.addAttribute("user", userOpt.get());
        return "user_edit";
    } else {
        return "redirect:/settings/users"; // 該当ユーザーがいない場合の処理
    }
}

@PostMapping("/settings/users/allupdate")
public String updateUser(@RequestParam Integer userId,
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
            user.setPassword(password); // ★ ハッシュ化するならここで対応
        }

        userRepository.save(user);
    }

    return "redirect:/settings/users";
}
@PostMapping("/settings/users/delete")
public String deleteUser(@RequestParam Integer userId) {
    userRepository.findById(userId).ifPresent(user -> {
        user.setIsDeleted(true);
        userRepository.save(user);
    });
    return "redirect:/settings/users";
}

}
