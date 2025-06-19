// productsテーブルに対応する商品エンティティクラスです。
package com.example.forecast.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @Column(name = "product_id")
    private Integer productId;

    private String name;
    private Integer price;

    @Column(name = "jan_code")
    private String janCode;

    @Column(name = "production_date")
    private LocalDate productionDate;

    @Column(name = "expiration_date")
    private LocalDate expirationDate;

    @Column(name = "stock_quantity")
    private Integer stockQuantity;

    public Product() {}

    public Product(Integer productId, String name, Integer price, String janCode) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.janCode = janCode;
    }

    // Getters & Setters

    public Integer getProductId() { return productId; }
    public void setProductId(Integer productId) { this.productId = productId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }

    public String getJanCode() { return janCode; }
    public void setJanCode(String janCode) { this.janCode = janCode; }

    public LocalDate getProductionDate() { return productionDate; }
    public void setProductionDate(LocalDate productionDate) { this.productionDate = productionDate; }

    public LocalDate getExpirationDate() { return expirationDate; }
    public void setExpirationDate(LocalDate expirationDate) { this.expirationDate = expirationDate; }

    public Integer getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(Integer stockQuantity) { this.stockQuantity = stockQuantity; }
}
