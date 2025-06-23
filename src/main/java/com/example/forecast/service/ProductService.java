// 商品に関するビジネスロジックを扱うサービスクラスです。
package com.example.forecast.service;

import com.example.forecast.model.Product;
import com.example.forecast.repository.ProductRepository;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

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

    // ✅ 商品名ごとの在庫合計マップを返す（販売日に有効な「登録由来」の在庫のみ）
    public Map<String, Integer> calculateInventoryByNameMap(LocalDate date) {
        LocalDate startDate = date.minusDays(15);
        LocalDate endDate = date;

        List<Product> products = repository.findByProductionDateBetween(startDate, endDate);

        Map<String, Integer> inventoryMap = new HashMap<>();
        for (Product product : products) {
            // 「sales_form」由来の在庫（＝保存元がその日登録されたもの）に限定
            if (product.getExpirationDate() != null &&
                !product.getExpirationDate().isBefore(date) &&
                product.getExpirationDate().equals(product.getProductionDate().plusDays(15))) {

                String name = product.getName();
                int stock = product.getStockQuantity();
                inventoryMap.merge(name, stock, Integer::sum);
            }
        }

        return inventoryMap;
    }

    @Transactional
    public boolean deductStockByName(String productName, int quantity, LocalDate saleDate) {
        List<Product> stockList = repository.findAll().stream()
            .filter(p -> productName.equals(p.getName()))
            .filter(p -> !p.getProductionDate().isAfter(saleDate))
            .filter(p -> !p.getExpirationDate().isBefore(saleDate))
            .sorted(Comparator.comparing(Product::getExpirationDate))
            .toList();

        int remaining = quantity;

        for (Product p : stockList) {
            if (remaining <= 0) break;

            int currentStock = p.getStockQuantity();
            int toDeduct = Math.min(currentStock, remaining);
            p.setStockQuantity(currentStock - toDeduct);
            repository.save(p);
            remaining -= toDeduct;
        }

        return remaining == 0;
    }

    public int getTotalAvailableStockByName(String name, LocalDate saleDate) {
        return repository.findAll().stream()
            .filter(p -> name.equals(p.getName()))
            .filter(p -> !p.getProductionDate().isAfter(saleDate))
            .filter(p -> !p.getExpirationDate().isBefore(saleDate))
            .mapToInt(Product::getStockQuantity)
            .sum();
    }

    public List<Product> getAllProductsSortedByName() {
        return repository.findAll(Sort.by("name"));
    }

    @Transactional
    public List<Product> createProductionOrders(LocalDate orderDate, List<Integer> productIds, List<Integer> quantities) {
        List<Product> inserted = new ArrayList<>();
        int maxId = repository.findAll().stream()
            .mapToInt(Product::getProductId)
            .max()
            .orElse(0);

        for (int i = 0; i < productIds.size(); i++) {
            int qty = quantities.get(i);
            if (qty <= 0) continue;

            Product base = repository.findById(productIds.get(i)).orElseThrow();

            Product newProduct = new Product();
            newProduct.setProductId(++maxId);
            newProduct.setName(base.getName());
            newProduct.setPrice(base.getPrice());
            newProduct.setJanCode(base.getJanCode());
            newProduct.setProductionDate(orderDate);
            newProduct.setExpirationDate(orderDate.plusDays(15)); // ← sales_form 登録用
            newProduct.setStockQuantity(qty);

            repository.save(newProduct);
            inserted.add(newProduct);
        }

        return inserted;
    }

    public List<Product> getUniqueProductsByName() {
        List<Product> all = repository.findAll();

        return all.stream()
            .collect(Collectors.groupingBy(
                Product::getName,
                Collectors.minBy(Comparator.comparingInt(Product::getProductId))
            ))
            .values().stream()
            .filter(Optional::isPresent)
            .map(Optional::get)
            .sorted(Comparator.comparing(Product::getName))
            .toList();
    }

    public List<Product> findByName(String name) {
        return repository.findAll().stream()
            .filter(p -> name.equals(p.getName()))
            .toList();
    }

    public void save(Product product) {
        repository.save(product);
    }

    public int getNextProductId() {
        return repository.findAll().stream()
            .mapToInt(Product::getProductId)
            .max()
            .orElse(0) + 1;
    }
}
