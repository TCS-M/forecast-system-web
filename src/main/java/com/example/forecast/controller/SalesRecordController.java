package com.example.forecast.controller;

import com.example.forecast.model.Product;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.service.ProductService;
import com.example.forecast.service.SalesRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/sales")
public class SalesRecordController {

    private final SalesRecordService salesRecordService;
    private final ProductService productService;

    public SalesRecordController(SalesRecordService salesRecordService, ProductService productService) {
        this.salesRecordService = salesRecordService;
        this.productService = productService;
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "sales_form";
    }

    @GetMapping("/list")   
     public String list(Model model) { 
        List<SalesRecord> products = productService.findAll();        
        model.addAttribute("products", products);        
        return "sales_list";    
    }
    
    @PostMapping("/saveAll")
    public String saveAll(@RequestParam("productIds") List<Integer> productIds,
                           @RequestParam("quantities") List<Integer> quantities) {

        for (int i = 0; i < productIds.size(); i++) {
            int qty = quantities.get(i);
            if (qty > 0) {
                Product product = productService.findById(productIds.get(i));
                SalesRecord record = new SalesRecord();
                record.setSaleDate(LocalDate.now());
                record.setProduct(product);
                record.setQuantity(qty);
                salesRecordService.save(record);
            }
        }
        return "redirect:/sales/list";
    }
}
