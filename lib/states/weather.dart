import 'package:flutter/foundation.dart';
import 'package:exam/common.dart';
import 'package:exam/models/weather.dart';
import 'package:exam/networks/weather_response.dart';

class WeatherModel extends ChangeNotifier {
    int cityId = 1843564; // 지역 ID (초기값은 인천ID)
    Weather _nowWeather; // 현재 날씨를 가지고 있는..

    Weather get nowWeather => _nowWeather;

    void setNowWeater(WeatherResponse weatherResponse){
        Common.log4method("WeatherModel.setNowWeater");
        Weather newItem = Weather(
            weatherResponse.id,
            weatherResponse.main.temp,
            weatherResponse.name,
            weatherResponse.sys.country,
            weatherResponse.weather[0].icon
        );
        this._nowWeather = newItem;
        notifyListeners();
    }
}