import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exam/common.dart';
import 'package:exam/networks/weather_response.dart';

class WeatherNetwork {
    // 날씨 API (오픈웨더)📑 https://openweathermap.org/current
    static const String _WEATHER_API_KEY = "464d3694cc263bc0bc931b853c471b80";
    static const String _WEATHER_API_BASE_URL = "https://api.openweathermap.org/data/2.5";
    static const baseHeaders = { "Content-type": "application/json" };

    static Future<WeatherResponse> getData4CityId(int cityId) async {
        try {
            final String url = Uri.encodeFull("$_WEATHER_API_BASE_URL/weather?appid=$_WEATHER_API_KEY&id=$cityId");
            Common.log4network(url);
            // 진짜로 통신!
            http.Response response = await http.get(url, headers: baseHeaders);
            Common.log4network(response.body);
            return WeatherResponse.fromJson(jsonDecode(response.body));
        } catch (e) {
            Common.log4error(e);
            return null;
        }
    }
}
