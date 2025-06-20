package com.example.forecast.repository;

import com.example.forecast.model.Forecast;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.Optional;
import java.time.LocalDate;
import java.util.List;

public interface ForecastRepository extends JpaRepository<Forecast, Integer> {
    List<Forecast> findByForecastDate(LocalDate forecastDate);

    @Query(value = "SELECT * FROM forecast WHERE EXTRACT(DOW FROM forecast_date) IN (1, 4)", nativeQuery = true)
    List<Forecast> findByOrderDays(); // 月曜(1)・木曜(4)

        // ForecastRepository.java
    Optional<Forecast> findByForecastDateAndProduct_ProductId(LocalDate forecastDate, Integer productId);

}
