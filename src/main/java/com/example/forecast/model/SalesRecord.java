package com.example.forecast.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "sales_records")
public class SalesRecord {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate saleDate;

    private String productName;

    private int quantity;

    public SalesRecord() {}

    public SalesRecord(LocalDate saleDate, String productName, int quantity) {
        this.saleDate = saleDate;
        this.productName = productName;
        this.quantity = quantity;
    }

    // Getters and Setters
    public Long getId() { return id; }

    public LocalDate getSaleDate() { return saleDate; }
    public void setSaleDate(LocalDate saleDate) { this.saleDate = saleDate; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
