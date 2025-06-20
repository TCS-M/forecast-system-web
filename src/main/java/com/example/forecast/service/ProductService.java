// 商品に関するビジネスロジックを扱うサービスクラスです。
package com.example.forecast.service;
import org.springframework.transaction.annotation.Transactional;
import com.example.forecast.model.Product;
import com.example.forecast.repository.ProductRepository;
import java.util.stream.Collectors;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
    @Transactional
    public boolean deductStock(Integer productId, int quantity, LocalDate saleDate) {
        List<Product> stockList = repository.findByProductIdAndExpirationDateAfterOrderByExpirationDateAsc(productId, saleDate);

        int remaining = quantity;
        for (Product p : stockList) {
            if (remaining <= 0) break;

            int currentStock = p.getStockQuantity();
            int toDeduct = Math.min(currentStock, remaining);
            p.setStockQuantity(currentStock - toDeduct);
            repository.save(p);
            remaining -= toDeduct;
        }

        // 扣完还剩的说明库存不够
        return remaining == 0;
    }
    public int getTotalAvailableStock(Integer productId, LocalDate saleDate) {
    List<Product> stockList = repository.findByProductIdAndExpirationDateAfterOrderByExpirationDateAsc(productId, saleDate);
    return stockList.stream()
                    .mapToInt(Product::getStockQuantity)
                    .sum();
                }
    // ✅ 商品名ごとの在庫合計マップを返す（販売日に有効な在庫のみ）
    public Map<String, Integer> calculateInventoryByNameMap(LocalDate date) {
        LocalDate startDate = date.minusDays(15);  // 範囲は任意
        LocalDate endDate = date;

        List<Product> products = repository.findByProductionDateBetween(startDate, endDate);

        Map<String, Integer> inventoryMap = new HashMap<>();
        for (Product product : products) {
            // 対象販売日の時点で有効な在庫
            if (product.getExpirationDate() != null && !product.getExpirationDate().isBefore(date)) {
                String name = product.getName();
                int stock = product.getStockQuantity();
                inventoryMap.merge(name, stock, Integer::sum);
            }
        }

        return inventoryMap;
    }
    // 指定商品名の在庫総量を取得（すべてのバッチ対象）
    public int getTotalAvailableStockByName(String name, LocalDate saleDate) {
        List<Product> all = repository.findAll();

        return all.stream()
                .filter(p -> name.equals(p.getName()))
                .filter(p -> !p.getProductionDate().isAfter(saleDate))
                .filter(p -> !p.getExpirationDate().isBefore(saleDate))
                .mapToInt(Product::getStockQuantity)
                .sum();
    }
    @Transactional
    public boolean deductStockByName(String productName, int quantity, LocalDate saleDate) {
        List<Product> stockList = repository.findAll().stream()
                .filter(p -> productName.equals(p.getName()))
                .filter(p -> !p.getProductionDate().isAfter(saleDate))
                .filter(p -> !p.getExpirationDate().isBefore(saleDate))
                .sorted(Comparator.comparing(Product::getExpirationDate)) // 先扣快过期的
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
    // 商品サービスクラスに発注処理を追加
    public List<Product> getAllProductsSortedByName() {
        return repository.findAll(Sort.by("name"));
    }

    // 商品に関するビジネスロジックを扱うサービスクラス
    @Transactional
    public List<Product> createProductionOrders(LocalDate orderDate, List<Integer> productIds, List<Integer> quantities) {
        List<Product> inserted = new ArrayList<>();
        int maxId = repository.findAll().stream()
                .mapToInt(Product::getProductId)
                .max()
                .orElse(0); // 既存の最大IDを取得（存在しない場合は0）

        for (int i = 0; i < productIds.size(); i++) {
            int qty = quantities.get(i);
            if (qty <= 0) continue;

            Product base = repository.findById(productIds.get(i)).orElseThrow();

            Product newProduct = new Product();
            newProduct.setProductId(++maxId); // product_idを手動採番（+1）
            newProduct.setName(base.getName());
            newProduct.setPrice(base.getPrice());
            newProduct.setJanCode(base.getJanCode());
            newProduct.setProductionDate(orderDate); // 指定された発注日
            newProduct.setExpirationDate(orderDate.plusDays(15)); // 賞味期限 = 発注日 +15日
            newProduct.setStockQuantity(qty); // 入力された数量

            repository.save(newProduct);
            inserted.add(newProduct); // 登録内容をリストに追加
        }

        return inserted;
    }
    // 商品名ごとに最小の productId を持つ製品のみを返す
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
}
