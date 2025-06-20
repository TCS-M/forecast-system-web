// 販売実績の入力・一覧表示を制御するコントローラーです。
package com.example.forecast.controller;

import com.example.forecast.model.SalesRecord;
import com.example.forecast.model.User;
import com.example.forecast.model.Product;
import com.example.forecast.repository.ProductRepository;
import com.example.forecast.repository.SalesRecordRepository;
import com.example.forecast.repository.UserRepository;
import com.example.forecast.service.ProductService;
import com.example.forecast.service.SalesRecordService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
public class SalesRecordController {

    // 商品情報へのアクセス
    @Autowired
    private ProductRepository productRepository;

    // 販売実績データへのアクセス
    @Autowired
    private SalesRecordRepository salesRecordRepository;

    // ユーザー情報へのアクセス
    @Autowired
    private UserRepository userRepository;

    // 在庫情報取得用のサービス
    @Autowired
    private ProductService productService;

    // 販売実績一覧取得サービス
    @Autowired
    private SalesRecordService salesRecordService;

    // 販売実績入力フォームを表示
    @GetMapping("/sales_form")
    public String showForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("username", user.getName());
        }

        LocalDate today = LocalDate.now();
        model.addAttribute("today", today);             
        model.addAttribute("defaultDate", today);       

        // 商品一覧取得
        List<Product> allProducts = productRepository.findAll();

        // 同名商品は1件だけ代表として使う（最初の1件を残す）
        Map<String, Product> productMap = new java.util.LinkedHashMap<>();
        for (Product p : allProducts) {
            productMap.putIfAbsent(p.getName(), p);
        }

        List<Product> uniqueProducts = new java.util.ArrayList<>(productMap.values());
        model.addAttribute("products", uniqueProducts);


        // ✅ 在庫情報（15日間の合計）を取得し、テンプレートに渡す
        model.addAttribute("inventoryMap", productService.calculateInventoryByNameMap(today));

        return "sales_form";
    }

    // フォームからの販売実績データを受け取り、保存

    @PostMapping("/sales/submit")
    public String submitSales(
            @RequestParam("saleDate") String saleDateStr,
            @RequestParam("productIds") List<Integer> productIds,
            @RequestParam("quantities") List<Integer> quantities,
            Model model,
            HttpSession session) {

        // ログインユーザーの取得
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            throw new RuntimeException("ログインユーザーがセッションに存在しません");
        }

        // 日付を LocalDate に変換
        LocalDate saleDate = LocalDate.parse(saleDateStr);

        // ✅ 在庫不足があるかを事前にチェック
            for (int i = 0; i < productIds.size(); i++) {
                int productId = productIds.get(i);
                int quantity = quantities.get(i);
                if (quantity > 0) {
                    String productName = productRepository.findById(productId)
                            .map(Product::getName)
                            .orElseThrow(() -> new RuntimeException("商品ID " + productId + " が見つかりません"));

                    int available = productService.getTotalAvailableStockByName(productName, saleDate);
                    if (quantity > available) {
                        // ❌ 在庫が不足 → 入力画面へ戻す
                        model.addAttribute("errorMessage", "商品ID " + productId + " の在庫が不足しています（在庫：" + available + "）");

                        // 同名商品1件ずつ取得（画面用）
                        List<Product> allProducts = productRepository.findAll();
                        Map<String, Product> productMap = new java.util.LinkedHashMap<>();
                        for (Product p : allProducts) {
                            productMap.putIfAbsent(p.getName(), p);
                        }
                        List<Product> uniqueProducts = new java.util.ArrayList<>(productMap.values());
                        model.addAttribute("products", uniqueProducts);

                        model.addAttribute("inventoryMap", productService.calculateInventoryByNameMap(saleDate));
                        model.addAttribute("defaultDate", saleDate);
                        model.addAttribute("quantities", quantities);
                        model.addAttribute("username", user.getName());
                        return "sales_form";
                    }
                }
            }

            // ✅ 在庫は足りている → 実際に在庫を減らして記録を保存
            for (int i = 0; i < productIds.size(); i++) {
                int productId = productIds.get(i);
                int quantity = quantities.get(i);
                if (quantity > 0) {
                    String productName = productRepository.findById(productId)
                            .map(Product::getName)
                            .orElseThrow(() -> new RuntimeException("商品ID " + productId + " が見つかりません"));

                    productService.deductStockByName(productName, quantity, saleDate);

                    SalesRecord record = new SalesRecord();
                    record.setSaleDate(saleDate);
                    record.setQuantity(quantity);
                    record.setProduct(productRepository.findById(productId).orElse(null));
                    record.setUser(user);
                    salesRecordRepository.save(record);
                }
            }

            return "redirect:/sales_list";
        }

    // 販売実績一覧画面を表示
    @GetMapping("/sales_list")
    public String showSalesList(@RequestParam(value = "filterDate", required = false) String filterDateStr,
                                Model model,
                                HttpSession session) {

        List<SalesRecord> records;
        LocalDate filterDate;

        if (filterDateStr != null && !filterDateStr.isEmpty()) {
            filterDate = LocalDate.parse(filterDateStr);
        } else {
            filterDate = LocalDate.now();  // ✅ デフォルトで今日の日付
        }

        records = salesRecordService.findBySaleDateWithUserAndProduct(filterDate);
        model.addAttribute("filterDate", filterDate.toString());  // ✅ フォームに渡す用

        model.addAttribute("records", records);

        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("username", user.getName());
        }

        return "sales_list";
    }
    //在庫数表示リアルタイム更新
    @GetMapping("/api/inventory")
    @ResponseBody
    public Map<String, Integer> getInventory(
            @RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
        return productService.calculateInventoryByNameMap(date);
    }

}
