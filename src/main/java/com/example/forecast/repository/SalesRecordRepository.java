//販売実績（salesテーブル）にアクセスするリポジトリです。
package com.example.forecast.repository;

import com.example.forecast.model.SalesRecord;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SalesRecordRepository extends JpaRepository<SalesRecord, Long> {
    // 商品情報を同時に読み込む（N+1問題を回避）
    @Query("SELECT r FROM SalesRecord r JOIN FETCH r.product")
    List<SalesRecord> findAllWithProduct();
    //すべての販売実績一覧
    @Query("SELECT s FROM SalesRecord s JOIN FETCH s.user JOIN FETCH s.product ORDER BY s.saleDate DESC")
    List<SalesRecord> findAllWithUserAndProduct();
}
