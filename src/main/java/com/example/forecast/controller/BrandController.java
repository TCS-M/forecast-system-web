// ビール銘柄管理用のコントローラクラス
package com.example.forecast.controller;

import com.example.forecast.model.Product;
import com.example.forecast.service.ProductService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/brand")
public class BrandController {

    @Autowired
    private ProductService productService;

    // 銘柄管理ページの表示処理
    @GetMapping("")
    public String showBrandPage(HttpSession session, Model model) {
        Object userObj = session.getAttribute("loggedInUser");
        if (userObj != null) {
            model.addAttribute("username", "管理者");
        }

        List<Product> list = productService.getUniqueProductsByName(); // 同名銘柄をまとめる
        model.addAttribute("uniqueProductList", list);
        return "brand_manage"; // brand_manage.html に遷移
    }

    // 価格の更新処理
    @PostMapping("/update")
    public String updatePrice(@RequestParam("productId") Integer productId,
                              @RequestParam("price") Integer price,
                              RedirectAttributes redirectAttributes) {

        Product p = productService.findById(productId);
        if (p != null) {
            List<Product> allSameName = productService.findByName(p.getName());
            for (Product product : allSameName) {
                product.setPrice(price); // 同名のすべてのロットの価格を更新
                productService.save(product);
            }
            redirectAttributes.addFlashAttribute("successMessage", "価格を更新しました。");
        }

        return "redirect:/brand";
    }

    // 新規銘柄の追加処理
    @PostMapping("/add")
    public String addBrand(@RequestParam("name") String name,
                        @RequestParam("price") Integer price,
                        @RequestParam("janCode") String janCode,
                        @RequestParam("stockQuantity") Integer stockQuantity,
                        RedirectAttributes redirectAttributes) {

        int newId = productService.getNextProductId();

        Product newProduct = new Product();
        newProduct.setProductId(newId);
        newProduct.setName(name);
        newProduct.setPrice(price);
        newProduct.setJanCode(janCode);

        // ✅ 設定：生産日 = 今日 / 消費期限 = 今日 + 15日
        LocalDate today = LocalDate.now();
        newProduct.setProductionDate(today);
        newProduct.setExpirationDate(today.plusDays(15));

        newProduct.setStockQuantity(stockQuantity);

        productService.save(newProduct);
        redirectAttributes.addFlashAttribute("successMessage",
            "新しい銘柄「" + name + "」を追加しました（在庫：" + stockQuantity + "）");

        return "redirect:/brand";
    }
}
