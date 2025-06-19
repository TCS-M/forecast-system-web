package com.example.forecast.controller;

import java.util.List;
import java.util.Optional;

import com.example.forecast.model.Forecast;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.model.User;
import com.example.forecast.repository.UserRepository;
import com.example.forecast.service.ForecastService;
import com.example.forecast.service.SalesRecordService;
import com.example.forecast.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminHomepageController {

    private final UserRepository userRepository;
    private final UserService userService;

    public AdminHomepageController(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
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
        user.setIsDeleted(false); // 新規は論理削除フラグOFF
        userService.saveUser(user); 
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

    @Autowired
    private ForecastService forecastService;

    @GetMapping("/admin_forecast")
    public String showAdminForecastList(Model model) {
        List<Forecast> forecasts = forecastService.getOrderForecasts(); 
        model.addAttribute("forecasts", forecasts);
        return "admin_forecast_list";
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

            // パスワードが空欄なら更新しない。入っていれば暗号化して上書き
            if (password != null && !password.isBlank()) {
                user.setPassword(password);
                userService.saveUser(user); // 暗号化して保存
            } else {
                userRepository.save(user); // パスワード以外だけ更新
            }
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

    @Controller
    @RequestMapping("/admin/sales")
    public class AdminSalesController {

        @Autowired
        private SalesRecordService salesRecordService;

        @GetMapping("/list")
        public String showList(Model model) {
            List<SalesRecord> records = salesRecordService.findAllWithUserAndProduct();
            model.addAttribute("records", records);
            return "admin_sales_list";
        }
    }
}
