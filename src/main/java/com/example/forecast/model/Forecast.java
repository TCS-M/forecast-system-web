package com.example.forecast.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "forecast")
public class Forecast {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name = "forecast_id")
    private Integer forecastId;

    @Column(name = "forecast_date")
    private LocalDate forecastDate;

    @Column(name = "predicted_sale_quantity")
    private Integer predictedSaleQuantity;

    @Column(name = "predicted_order_quantity")
    private Integer predictedOrderQuantity;

    @Column(name = "weekday")
    private String weekday;

    @Column(name = "weather_temp")
    private Double weatherTemp;

    @Column(name = "weather_humidity")
    private Double weatherHumidity;

    @Column(name = "white_beer")
    private Double whiteBeer;

    @Column(name = "ipa")
    private Double ipa;

    @Column(name = "black_beer")
    private Double blackBeer;

    @Column(name = "lager")
    private Double lager;

    @Column(name = "fruit_beer")
    private Double fruitBeer;

    @Column(name = "pale_ale")
    private Double paleAle;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", referencedColumnName = "product_id")
    private Product product;

    // --- Getter / Setter ---

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

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public Double getWeatherTemp() {
        return weatherTemp;
    }

    public void setWeatherTemp(Double weatherTemp) {
        this.weatherTemp = weatherTemp;
    }

    public Double getWeatherHumidity() {
        return weatherHumidity;
    }

    public void setWeatherHumidity(Double weatherHumidity) {
        this.weatherHumidity = weatherHumidity;
    }

    public Double getWhiteBeer() {
        return whiteBeer;
    }

    public void setWhiteBeer(Double whiteBeer) {
        this.whiteBeer = whiteBeer;
    }

    public Double getIpa() {
        return ipa;
    }

    public void setIpa(Double ipa) {
        this.ipa = ipa;
    }

    public Double getBlackBeer() {
        return blackBeer;
    }

    public void setBlackBeer(Double blackBeer) {
        this.blackBeer = blackBeer;
    }

    public Double getLager() {
        return lager;
    }

    public void setLager(Double lager) {
        this.lager = lager;
    }

    public Double getFruitBeer() {
        return fruitBeer;
    }

    public void setFruitBeer(Double fruitBeer) {
        this.fruitBeer = fruitBeer;
    }

    public Double getPaleAle() {
        return paleAle;
    }

    public void setPaleAle(Double paleAle) {
        this.paleAle = paleAle;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getProductId() {
        return product != null ? product.getProductId() : null;
    }
    public void setProductId(int productId) {
    if (this.product == null) {
        this.product = new Product();
    }
    this.product.setProductId(productId);
    }

}
