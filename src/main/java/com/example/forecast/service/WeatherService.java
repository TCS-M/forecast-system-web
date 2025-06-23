package com.example.forecast.service;

import com.example.forecast.dto.WeatherDetailDTO;
import com.example.forecast.model.WeatherData;
import com.example.forecast.model.SalesRecord;
import com.example.forecast.repository.WeatherDataRepository;
import com.example.forecast.repository.SalesRecordRepository;
import com.example.forecast.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class WeatherService {

    @Autowired
    private WeatherDataRepository weatherDataRepository;

    @Autowired
    private SalesRecordRepository salesRecordRepository;

    @Autowired
    private ProductService productService;

    public List<WeatherData> getWeatherWithSales() {
        List<WeatherData> weatherList = weatherDataRepository.findAll();

        for (WeatherData weather : weatherList) {
            Date date = weather.getWeatherDate();
            LocalDate localDate = date.toLocalDate();

            int totalSales = salesRecordRepository.findBySaleDateWithUserAndProduct(localDate)
                .stream()
                .mapToInt(SalesRecord::getQuantity)
                .sum();

            weather.setTotalSales(totalSales);
        }

        return weatherList.stream()
                .sorted(Comparator.comparing(WeatherData::getWeatherDate).reversed())
                .collect(Collectors.toList());
    }

    public WeatherDetailDTO getDetailByDate(String dateStr) {
        try {
            LocalDate targetDate = LocalDate.parse(dateStr);
            java.sql.Date sqlDate = java.sql.Date.valueOf(targetDate);

            WeatherData weatherData = weatherDataRepository.findById(sqlDate).orElse(null);
            String weatherInfo = (weatherData != null) ? weatherData.getWeatherInfo() : null;
            Double water = (weatherData != null) ? weatherData.getWater() : null;
            Double wind = (weatherData != null) ? weatherData.getWind() : null;
            Double temperature = (weatherData != null) ? weatherData.getTemperature() : null;

            List<SalesRecord> salesRecords = salesRecordRepository.findBySaleDateWithUserAndProduct(targetDate);
            Map<String, Integer> productSales = new HashMap<>();
            for (SalesRecord record : salesRecords) {
                String productName = record.getProduct().getName();
                productSales.put(productName,
                        productSales.getOrDefault(productName, 0) + record.getQuantity());
            }

            Map<String, Integer> productStock = productService.calculateInventoryByNameMap(targetDate);

            return new WeatherDetailDTO(
                    dateStr,
                    weatherInfo,
                    productSales,
                    water,
                    wind,
                    temperature,
                    productStock
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
