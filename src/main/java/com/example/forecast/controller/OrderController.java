// 発注機能のコントローラ
package com.example.forecast.controller;

import com.example.forecast.model.Product;
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
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user/order")
public class OrderController {

    @Autowired
    private ProductService productService;


    // 発注データの処理
    @GetMapping("")
    public String showOrderForm(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj instanceof User user) {
            model.addAttribute("username", user.getName());
        }

        List<Product> list = productService.getUniqueProductsByName();
        model.addAttribute("productList", list);
        model.addAttribute("defaultDate", LocalDate.now());

        // ✅ 加入在库信息（用今天的日期）
        model.addAttribute("inventoryMap", productService.calculateInventoryByNameMap(LocalDate.now()));

        return "order_form";
    }

    @ResponseBody
    public String debugUniqueProducts() {
        List<Product> list = productService.getUniqueProductsByName();
        return list.stream()
                .map(p -> p.getProductId() + " - " + p.getName())
                .collect(Collectors.joining("<br>"));
    }
    // 発注機能のコントローラ
    @PostMapping("/submit")
    public String submitOrder(@RequestParam("orderDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate orderDate,
                            @RequestParam("productIds") List<Integer> productIds,
                            @RequestParam("quantities") List<Integer> quantities,
                            RedirectAttributes redirectAttributes) {

        List<Product> inserted = productService.createProductionOrders(orderDate, productIds, quantities);

        if (inserted.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMessage", "1つ以上の発注数を入力してください。");
            return "redirect:/user/order";
        }

        String message = inserted.stream()
            .map(p -> String.format("%s（%d個）", p.getName(), p.getStockQuantity()))
            .collect(Collectors.joining("、"));

        redirectAttributes.addFlashAttribute("successMessage", "以下の商品を発注しました：\n" + message);

        return "redirect:/user/order";
    }

}
