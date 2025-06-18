//商品に関するビジネスロジックを扱うサービスクラスです。
package com.example.forecast.service;

import com.example.forecast.model.Product;
import com.example.forecast.repository.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
