// 商品に関するビジネスロジックを扱うサービスクラスです。
package com.example.forecast.service;

import com.example.forecast.model.Product;
import com.example.forecast.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    private final ProductRepository repository;

    public ProductService(ProductRepository repository) {
        this.repository = repository;
    }

    public List<Product> findAll() {
        return repository.findAll();
    }

    public Product findById(Integer id) {
        return repository.findById(id).orElse(null);
    }

    // ✅ 在庫計算メソッド（内部に正しく書く）
    public Map<Integer, Integer> calculateInventoryMap(LocalDate date) {
        LocalDate startDate = date.minusDays(15);
        LocalDate endDate = date;

        List<Product> recentProducts = repository.findByProductionDateBetween(startDate, endDate);

        Map<Integer, Integer> inventoryMap = new HashMap<>();
        for (Product product : recentProducts) {
            int productId = product.getProductId();
            int stock = product.getStockQuantity();
            inventoryMap.merge(productId, stock, Integer::sum);
        }

        return inventoryMap;
    }
}
