package com.example.forecast.repository;

import com.example.forecast.model.Forecast;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface ForecastRepository extends JpaRepository<Forecast, Integer> {

    @Query(value = "SELECT * FROM forecast WHERE EXTRACT(DOW FROM forecast_date) IN (1, 4)", nativeQuery = true)
    List<Forecast> findMondayAndThursdayForecasts();
}
