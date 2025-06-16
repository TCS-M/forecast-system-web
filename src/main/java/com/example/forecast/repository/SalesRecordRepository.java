package com.example.forecast.repository;

import com.example.forecast.model.SalesRecord;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SalesRecordRepository extends JpaRepository<SalesRecord, Long> {
}
