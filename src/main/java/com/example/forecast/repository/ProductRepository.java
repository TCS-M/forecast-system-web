// 製品テーブルにアクセスするためのリポジトリインタフェース  
package com.example.forecast.repository;

import com.example.forecast.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    // ✅ 指定した期間の生産日を持つ商品を取得
    List<Product> findByProductionDateBetween(LocalDate startDate, LocalDate endDate);

    // ✅ 有効期限が販売日以降の在庫を有効期限昇順で取得（在庫削減に使用）
    List<Product> findByProductIdAndExpirationDateAfterOrderByExpirationDateAsc(Integer productId, LocalDate saleDate);
}
