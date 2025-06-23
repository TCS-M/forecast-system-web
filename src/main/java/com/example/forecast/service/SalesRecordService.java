package com.example.forecast.service;

import com.example.forecast.model.Product;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.repository.SalesRecordRepository;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class SalesRecordService {

    private final SalesRecordRepository repository;
    private final ProductService productService;

    public SalesRecordService(SalesRecordRepository repository,
                              ProductService productService) {
        this.repository = repository;
        this.productService = productService;
    }

    public SalesRecord save(SalesRecord record) {
        if (record.getQuantity() < 0) {
            throw new IllegalArgumentException("販売本数は0以上にしてください");
        }
        return repository.save(record);
    }

    // 全件取得
    public List<SalesRecord> findAll() {
        return repository.findAll();
    }

    // ユーザー・商品含め全件取得
    public List<SalesRecord> findAllWithUserAndProduct() {
        return repository.findAllWithUserAndProduct();
    }

    // 指定日付の販売記録取得
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

        // ✅ ① 新在庫の確認（旧在庫はまだ戻さない）
        int available = productService.getTotalAvailableStockByName(name, newDate);
        if (newQty > available) return false;

        // ✅ ② 旧在庫を復元
        Product recovery = new Product();
        recovery.setProductId(productService.getNextProductId());
        recovery.setName(product.getName());
        recovery.setJanCode(product.getJanCode());
        recovery.setPrice(product.getPrice());
        recovery.setProductionDate(oldDate.minusDays(15));
        recovery.setExpirationDate(oldDate);
        recovery.setStockQuantity(oldQty);
        productService.save(recovery);

        // ✅ ③ 新在庫から減算
        productService.deductStockByName(name, newQty, newDate);

        // ✅ ④ 販売記録を更新
        record.setSaleDate(newDate);
        record.setQuantity(newQty);
        repository.save(record);
        return true;
    }

    @Transactional
    public void restoreStockAndDelete(int saleId) {
        SalesRecord record = repository.findById((long) saleId).orElseThrow();
        Product product = record.getProduct();
        int qty = record.getQuantity();
        LocalDate oldDate = record.getSaleDate();

        Product restored = new Product();
        restored.setProductId(productService.getNextProductId());
        restored.setName(product.getName());
        restored.setJanCode(product.getJanCode());
        restored.setPrice(product.getPrice());
        restored.setProductionDate(oldDate.minusDays(15));
        restored.setExpirationDate(oldDate);
        restored.setStockQuantity(qty);
        productService.save(restored);

        repository.delete(record);
    }
}
