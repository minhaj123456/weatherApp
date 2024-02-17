// import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class WeatherApi {
  static const String apiKey = 'your_api_key';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  static Future<http.Response> fetchWeather(double lat, double lon) async {
    final url = '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    return await http.get(Uri.parse(url));
  }

  static Future<http.Response> fetchWeatherByLocation(String city, String country) async {
    final url = '$baseUrl?q=$city,$country&appid=$apiKey&units=metric';
    return await http.get(Uri.parse(url));
  }
}
