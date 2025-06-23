package com.example.forecast.service;

import com.example.forecast.model.WeatherData;
import com.example.forecast.repository.WeatherDataRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.sql.Date;
import java.time.LocalDate;

@Service
public class WeatherApiService {

    private final WeatherDataRepository weatherRepo;

    public WeatherApiService(WeatherDataRepository weatherRepo) {
        this.weatherRepo = weatherRepo;
    }

    public void fetchAndSaveForecastData() {
        String url = "https://forecast-beer.azurewebsites.net/forecast";
        RestTemplate restTemplate = new RestTemplate();
        ObjectMapper mapper = new ObjectMapper();

        try {
            String json = restTemplate.getForObject(url, String.class);
            JsonNode root = mapper.readTree(json);
            JsonNode predictions = root.get("predictions");

            for (JsonNode item : predictions) {
                LocalDate date = LocalDate.parse(item.get("date").asText());
                Date sqlDate = Date.valueOf(date);

                if (weatherRepo.existsById(sqlDate)) continue; // 既に登録済みならスキップ

                JsonNode weatherNode = item.get("weather");
                if (weatherNode == null || item.get("total").isNull()) continue;

                WeatherData data = new WeatherData();
                data.setWeatherDate(sqlDate);
                data.setWeatherInfo("予測");
                data.setTemperature(weatherNode.get("temp").asDouble());
                data.setWind(weatherNode.get("wind_speed").asDouble());
                data.setWater(weatherNode.get("rain").asDouble());

                weatherRepo.save(data);
            }

        } catch (Exception e) {
            System.err.println("❌ API取得エラー: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
