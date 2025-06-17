package com.example.forecast.model;

import jakarta.persistence.*;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @Column(name = "product_id")
    private Integer productId;

    private String name;
    private Integer price;
    private String janCode;

    public Product() {}

    public Product(Integer productId, String name, Integer price, String janCode) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.janCode = janCode;
    }

    public Integer getProductId() { return productId; }
    public void setProductId(Integer productId) { this.productId = productId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }

    public String getJanCode() { return janCode; }
    public void setJanCode(String janCode) { this.janCode = janCode; }
}

