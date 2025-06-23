package com.example.forecast.service;

import com.example.forecast.model.Product;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.repository.SalesRecordRepository;
import com.example.forecast.repository.WeatherDataRepository;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class SalesRecordService {

    private final SalesRecordRepository repository;
    private final ProductService productService;
    private final WeatherDataRepository weatherDataRepository;

    public SalesRecordService(SalesRecordRepository repository,
                              ProductService productService,
                              WeatherDataRepository weatherDataRepository) {
        this.repository = repository;
        this.productService = productService;
        this.weatherDataRepository = weatherDataRepository;
    }

    public SalesRecord save(SalesRecord record) {
        if (record.getQuantity() < 0) {
            throw new IllegalArgumentException("販売本数は0以上にしてください");
        }
        return repository.save(record);
    }

    public List<SalesRecord> findAll() {
        return repository.findAll();
    }

    public List<SalesRecord> findAllWithUserAndProduct() {
        return repository.findAllWithUserAndProduct();
    }

    public List<SalesRecord> findBySaleDateWithUserAndProduct(LocalDate date) {
        return repository.findBySaleDateWithUserAndProduct(date);
    }

    //================== 実績編集 =======================
    @Transactional
    public boolean updateSaleRecord(int saleId, LocalDate newDate, int newQty) {
        SalesRecord record = repository.findById((long) saleId).orElseThrow();
        Product product = record.getProduct();
        String name = product.getName();
        LocalDate oldDate = record.getSaleDate();
        int oldQty = record.getQuantity();

        // ✅ ① 新在庫の確認
        int available = productService.getTotalAvailableStockByName(name, newDate);
        if (newQty > available) return false;

        // ✅ ② 旧在庫を復元（新販売日の在庫と重ならないように期限設定）
        Product recovery = new Product();
        recovery.setProductId(productService.getNextProductId());
        recovery.setName(product.getName());
        recovery.setJanCode(product.getJanCode());
        recovery.setPrice(product.getPrice());
        recovery.setProductionDate(oldDate.minusDays(15));

        // ⚠️ expirationDate を newDate.minusDays(1) にして、新しい販売日に被らないようにする
        recovery.setExpirationDate(newDate.minusDays(1));
        recovery.setStockQuantity(oldQty);
        productService.save(recovery);

        // ✅ ③ 新在庫から減算
        productService.deductStockByName(name, newQty, newDate);

        // ✅ ④ 販売記録を更新
        record.setSaleDate(newDate);
        record.setQuantity(newQty);
        repository.save(record);

        updateTotalSales(newDate);
        return true;
    }

    @Transactional
    public void restoreStockAndDelete(int saleId) {
        SalesRecord record = repository.findById((long) saleId).orElseThrow();
        Product product = record.getProduct();
        int qty = record.getQuantity();
        LocalDate oldDate = record.getSaleDate();

        // ✅ 削除時の復元在庫も、将来日と重ならないように期限設定
        Product restored = new Product();
        restored.setProductId(productService.getNextProductId());
        restored.setName(product.getName());
        restored.setJanCode(product.getJanCode());
        restored.setPrice(product.getPrice());
        restored.setProductionDate(oldDate.minusDays(15));
        restored.setExpirationDate(oldDate.minusDays(1));  // ← 削除後の将来販売日と重ならないように
        restored.setStockQuantity(qty);
        productService.save(restored);

        repository.delete(record);

        updateTotalSales(oldDate);
    }

    private void updateTotalSales(LocalDate date) {
        List<SalesRecord> records = repository.findBySaleDateWithUserAndProduct(date);
        int totalSales = records.stream().mapToInt(SalesRecord::getQuantity).sum();

        weatherDataRepository.findById(java.sql.Date.valueOf(date)).ifPresent(w -> {
            w.setTotalSales(totalSales);
            weatherDataRepository.save(w);
        });
    }
}

