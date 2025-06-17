//販売実績に関するビジネスロジックを扱うサービスクラスです。
package com.example.forecast.service;

import com.example.forecast.model.SalesRecord;
import com.example.forecast.repository.SalesRecordRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalesRecordService {

    private final SalesRecordRepository repository;

    public SalesRecordService(SalesRecordRepository repository) {
        this.repository = repository;
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
}
