package com.example.forecast.service;

import com.example.forecast.dto.ForecastDto;
import com.example.forecast.model.Forecast;
import com.example.forecast.repository.ForecastRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class ForecastService {

    @Autowired
    private ForecastRepository forecastRepository;

    // 既存DBに古いデータがあっても消さず、API分だけ「新規日付＋製品IDごとに」追加
    public List<Forecast> getForecasts() throws Exception {
        // すでにDBに予測があっても「APIの未来分」は追加したい場合
        // APIから予測取得
        RestTemplate restTemplate = new RestTemplate();
        String json = restTemplate.getForObject("https://forecast-beer.azurewebsites.net/forecast", String.class);

        ObjectMapper mapper = new ObjectMapper();
        JsonNode predictions = mapper.readTree(json).path("predictions");
        ForecastDto[] dtos = mapper.treeToValue(predictions, ForecastDto[].class);

        // 各予測（API）→ DBに存在しなければ新規保存
for (ForecastDto dto : dtos) {
    LocalDate forecastDate = LocalDate.parse(dto.getDate());
    String weekday = dto.getWeekday();
    Double weatherTemp = dto.getWeather().getTemp();
    Double weatherHumidity = dto.getWeather().getHumidity();

    addIfNotExists(forecastDate, 1, dto.getWhiteBeer(), weekday, weatherTemp, weatherHumidity);
    addIfNotExists(forecastDate, 2, dto.getLager(), weekday, weatherTemp, weatherHumidity);
    addIfNotExists(forecastDate, 3, dto.getPaleAle(), weekday, weatherTemp, weatherHumidity);
    addIfNotExists(forecastDate, 4, dto.getFruitBeer(), weekday, weatherTemp, weatherHumidity);
    addIfNotExists(forecastDate, 5, dto.getBlackBeer(), weekday, weatherTemp, weatherHumidity);
    addIfNotExists(forecastDate, 6, dto.getIpa(), weekday, weatherTemp, weatherHumidity);
}

        // 古いものも含めて全件返却
        return forecastRepository.findAll();
    }

    // すでにDBに同じ日付・同じ製品IDのデータがあればスキップ
private void addIfNotExists(LocalDate date, int productId, Double predictedSaleQuantity,
                            String weekday, Double weatherTemp, Double weatherHumidity) {
    Optional<Forecast> exists = forecastRepository.findByForecastDateAndProduct_ProductId(date, productId);
    if (exists.isEmpty() && predictedSaleQuantity != null) {
        Forecast f = new Forecast();
        f.setForecastDate(date);
        f.setProductId(productId);
        f.setPredictedSaleQuantity(predictedSaleQuantity.intValue());
        f.setWeekday(weekday);
        f.setWeatherTemp(weatherTemp);
        f.setWeatherHumidity(weatherHumidity);

        // さらにproductIdごとに各ビール量をセットしたい場合
        switch (productId) {
            case 1: f.setWhiteBeer(predictedSaleQuantity); break;
            case 2: f.setLager(predictedSaleQuantity); break;
            case 3: f.setPaleAle(predictedSaleQuantity); break;
            case 4: f.setFruitBeer(predictedSaleQuantity); break;
            case 5: f.setBlackBeer(predictedSaleQuantity); break;
            case 6: f.setIpa(predictedSaleQuantity); break;
        }
        forecastRepository.save(f);
    }
}


    // 月曜・木曜の注文用予測データのみ取得
    public List<Forecast> getOrderForecasts() {
        return forecastRepository.findByOrderDays();
    }
}
