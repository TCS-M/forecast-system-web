package com.example.forecast.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "forecast")
public class Forecast {
    @Id
    private Integer forecastId;

    private LocalDate forecastDate;
    private Integer predictedSaleQuantity;
    private Integer predictedOrderQuantity;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    public Integer getForecastId() {
        return forecastId;
    }

    public void setForecastId(Integer forecastId) {
        this.forecastId = forecastId;
    }

    public LocalDate getForecastDate() {
        return forecastDate;
    }

    public void setForecastDate(LocalDate forecastDate) {
        this.forecastDate = forecastDate;
    }

    public Integer getPredictedSaleQuantity() {
        return predictedSaleQuantity;
    }

    public void setPredictedSaleQuantity(Integer predictedSaleQuantity) {
        this.predictedSaleQuantity = predictedSaleQuantity;
    }

    public Integer getPredictedOrderQuantity() {
        return predictedOrderQuantity;
    }

    public void setPredictedOrderQuantity(Integer predictedOrderQuantity) {
        this.predictedOrderQuantity = predictedOrderQuantity;
    }

    // Forecast.java の末尾などに追加
    public Integer getProductId() {
        return product != null ? product.getProductId() : null;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
