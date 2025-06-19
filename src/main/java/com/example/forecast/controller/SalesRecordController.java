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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

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
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);

        // ✅ 在庫情報（15日間の合計）を取得し、テンプレートに渡す
        model.addAttribute("inventoryMap", productService.calculateInventoryMap(today));

        return "sales_form";
    }

    // フォームからの販売実績データを受け取り、保存
    @PostMapping("/sales/submit")
    public String submitSales(
            @RequestParam("saleDate") String saleDateStr, // ✅ 接收日付
            @RequestParam("productIds") List<Integer> productIds,
            @RequestParam("quantities") List<Integer> quantities,
            HttpSession session) {

        // ログインユーザーの取得
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            throw new RuntimeException("ログインユーザーがセッションに存在しません");
        }

        // ✅ String を LocalDate に変換
        LocalDate saleDate = LocalDate.parse(saleDateStr);

        for (int i = 0; i < productIds.size(); i++) {
            int quantity = quantities.get(i);
            if (quantity > 0) {
                SalesRecord record = new SalesRecord();
                record.setSaleDate(saleDate); // ✅ ユーザーが指定した日付をセット
                record.setQuantity(quantity);
                record.setProduct(productRepository.findById(productIds.get(i)).orElse(null));
                record.setUser(user);
                salesRecordRepository.save(record);
            }
        }

        return "redirect:/sales_list";
    }

    // 販売実績一覧画面を表示
    @GetMapping("/sales_list")
    public String showSalesList(Model model, HttpSession session) {
        List<SalesRecord> records = salesRecordService.findAllWithUserAndProduct(); 
        model.addAttribute("records", records);

        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("username", user.getName());
        }

        return "sales_list";
    }
}
