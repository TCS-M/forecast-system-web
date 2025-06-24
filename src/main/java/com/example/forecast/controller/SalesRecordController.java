package com.example.forecast.controller;

import com.example.forecast.model.SalesRecord;
import com.example.forecast.model.User;
import com.example.forecast.model.Product;
import com.example.forecast.model.WeatherData;
import com.example.forecast.repository.ProductRepository;
import com.example.forecast.repository.SalesRecordRepository;
import com.example.forecast.repository.UserRepository;
import com.example.forecast.repository.WeatherDataRepository;
import com.example.forecast.service.ProductService;
import com.example.forecast.service.SalesRecordService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;

@Controller
public class SalesRecordController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SalesRecordRepository salesRecordRepository;

    @Autowired
    private WeatherDataRepository weatherDataRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private SalesRecordService salesRecordService;

    // --- ユーザー取得共通メソッド ---
    private User getCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String emailOrName = auth.getName();
        return userRepository.findByEmailAndIsDeletedFalse(emailOrName)
                .orElseGet(() -> userRepository.findByNameAndIsDeletedFalse(emailOrName).orElse(null));
    }

    @GetMapping("/sales_form")
    public String showForm(Model model) {
        User user = getCurrentUser();
        if (user != null) {
            model.addAttribute("username", user.getName());
        }

        LocalDate today = LocalDate.now();
        model.addAttribute("today", today);
        model.addAttribute("defaultDate", today);

        List<Product> allProducts = productRepository.findAll();
        Map<String, Product> productMap = new LinkedHashMap<>();
        for (Product p : allProducts) {
            productMap.putIfAbsent(p.getName(), p);
        }
        List<Product> uniqueProducts = new ArrayList<>(productMap.values());
        model.addAttribute("products", uniqueProducts);

        model.addAttribute("inventoryMap", productService.calculateInventoryByNameMap(today));
        return "sales_form";
    }

    @PostMapping("/sales/submit")
    public String submitSales(
            @RequestParam("saleDate") String saleDateStr,
            @RequestParam("productIds") List<Integer> productIds,
            @RequestParam("quantities") List<Integer> quantities,
            @RequestParam("weatherInfo") String weatherInfo,
            @RequestParam("water") Double water,
            @RequestParam("wind") Double wind,
            @RequestParam("temperature") Double temperature,
            Model model) {

        User user = getCurrentUser();
        if (user == null)
            throw new RuntimeException("ログインユーザーが見つかりません");

        LocalDate saleDate = LocalDate.parse(saleDateStr);

        // ✅ 在庫チェック
        for (int i = 0; i < productIds.size(); i++) {
            int productId = productIds.get(i);
            int quantity = quantities.get(i);
            if (quantity > 0) {
                String productName = productRepository.findById(productId)
                        .map(Product::getName)
                        .orElseThrow(() -> new RuntimeException("商品ID " + productId + " が見つかりません"));

                int available = productService.getTotalAvailableStockByName(productName, saleDate);
                if (quantity > available) {
                    model.addAttribute("errorMessage", "商品ID " + productId + " の在庫が不足しています（在庫：" + available + "）");

                    List<Product> allProducts = productRepository.findAll();
                    Map<String, Product> productMap = new LinkedHashMap<>();
                    for (Product p : allProducts) {
                        productMap.putIfAbsent(p.getName(), p);
                    }
                    List<Product> uniqueProducts = new ArrayList<>(productMap.values());
                    model.addAttribute("products", uniqueProducts);

                    model.addAttribute("inventoryMap", productService.calculateInventoryByNameMap(saleDate));
                    model.addAttribute("defaultDate", saleDate);
                    model.addAttribute("quantities", quantities);
                    model.addAttribute("username", user.getName());
                    return "sales_form";
                }
            }
        }

        // ✅ 販売実績登録
        for (int i = 0; i < productIds.size(); i++) {
            int productId = productIds.get(i);
            int quantity = quantities.get(i);
            if (quantity > 0) {
                productService.deductStockByName(
                        productRepository.findById(productId).map(Product::getName).orElseThrow(), quantity, saleDate);

                SalesRecord record = new SalesRecord();
                record.setSaleDate(saleDate);
                record.setQuantity(quantity);
                record.setProduct(productRepository.findById(productId).orElse(null));
                record.setUser(user);
                salesRecordRepository.save(record);
            }
        }

        // ✅ 天気データ保存（未登録の場合のみ）
        java.sql.Date sqlDate = java.sql.Date.valueOf(saleDate);
        weatherDataRepository.findById(sqlDate).orElseGet(() -> {
            WeatherData wd = new WeatherData();
            wd.setWeatherDate(sqlDate);
            wd.setWeatherInfo(weatherInfo);
            wd.setWater(water);
            wd.setWind(wind);
            wd.setTemperature(temperature);
            return weatherDataRepository.save(wd);
        });

        return "redirect:/sales_list";
    }

    @GetMapping("/sales_list")
    public String showSalesList(@RequestParam(value = "filterDate", required = false) String filterDateStr,
            Model model) {
        List<SalesRecord> records;
        LocalDate filterDate = (filterDateStr != null && !filterDateStr.isEmpty())
                ? LocalDate.parse(filterDateStr)
                : LocalDate.now();

        records = salesRecordService.findBySaleDateWithUserAndProduct(filterDate);
        model.addAttribute("filterDate", filterDate.toString());
        model.addAttribute("records", records);

        User user = getCurrentUser();
        if (user != null) {
            model.addAttribute("username", user.getName());
        }

        return "sales_list";
    }

    @GetMapping("/api/inventory")
    @ResponseBody
    public Map<String, Integer> getInventory(
            @RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date) {
        return productService.calculateInventoryByNameMap(date);
    }

    // ==================実績編集=======================
    @PostMapping("/admin/sales/update")
    @ResponseBody
    public ResponseEntity<String> updateSaleRecord(@RequestParam("saleId") int saleId,
            @RequestParam("newDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate newDate,
            @RequestParam("newQuantity") int newQuantity) {
        boolean success = salesRecordService.updateSaleRecord(saleId, newDate, newQuantity);
        return success ? ResponseEntity.ok("更新完了") : ResponseEntity.badRequest().body("在庫が不足しています。");
    }

    @PostMapping("/admin/sales/delete")
    @ResponseBody
    public ResponseEntity<String> deleteSaleRecord(@RequestParam("saleId") int saleId) {
        salesRecordService.restoreStockAndDelete(saleId);
        return ResponseEntity.ok("削除完了");
    }
}
