// 製品テーブルにアクセスするためのリポジトリインタフェース
package com.example.forecast.repository;

import com.example.forecast.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}
