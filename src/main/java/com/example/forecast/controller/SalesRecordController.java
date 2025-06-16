package com.example.forecast.controller;

import com.example.forecast.model.SalesRecord;
import com.example.forecast.service.SalesRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/sales")
public class SalesRecordController {

    private final SalesRecordService service;

    public SalesRecordController(SalesRecordService service) {
        this.service = service;
    }

    @GetMapping("/new")
    public String showForm(Model model) {
        model.addAttribute("salesRecord", new SalesRecord());
        return "sales_form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute SalesRecord salesRecord) {
        service.save(salesRecord);
        return "redirect:/sales/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<SalesRecord> records = service.findAll();
        model.addAttribute("records", records);
        return "sales_list";
    }
}
