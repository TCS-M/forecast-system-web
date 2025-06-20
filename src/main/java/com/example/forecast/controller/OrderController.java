// 発注機能のコントローラ
package com.example.forecast.controller;

import com.example.forecast.model.User;
import com.example.forecast.service.ProductService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/user/order")
public class OrderController {

    @Autowired
    private ProductService productService;

    // 発注ページの表示処理
    @GetMapping
    public String showOrderForm(Model model, Principal principal) {
        model.addAttribute("username", principal.getName());
        model.addAttribute("productList", productService.getAllProductsSortedByName());
        model.addAttribute("defaultDate", LocalDate.now());
        return "order_form";
    }

    // 発注データの処理
    @GetMapping("/order_form")
    public String showOrderForm(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }
        model.addAttribute("productList", productService.getAllProductsSortedByName());
        model.addAttribute("defaultDate", LocalDate.now());
        return "order_form";
    }
}
