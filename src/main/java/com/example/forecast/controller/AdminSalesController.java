package com.example.forecast.controller;

import com.example.forecast.model.SalesRecord;
import com.example.forecast.service.SalesRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
public class AdminSalesController {

    @Autowired
    private SalesRecordService salesRecordService;

    @GetMapping("/admin_sales_list")
    public String showAdminSalesList(
            @RequestParam(value = "filterDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate filterDate,
            Model model) {

        if (filterDate == null) {
            filterDate = LocalDate.now(); // ✅ 今日
        }

        List<SalesRecord> records = salesRecordService.findBySaleDateWithUserAndProduct(filterDate);

        model.addAttribute("records", records);
        model.addAttribute("filterDate", filterDate);

        return "admin_sales_list";
    }
}