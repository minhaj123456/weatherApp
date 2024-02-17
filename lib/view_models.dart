import 'package:flutter/material.dart';
// import 'package:weather_app/models/weather.dart';
// import 'package:weather_app/repository/weather_repository.dart';
import 'package:whetherapp/repository.dart';
import 'package:whetherapp/whether.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _repository = WeatherRepository();

  Weather? _weather;
  Weather? get weather => _weather;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> fetchWeather(double lat, double lon) async {
    try {
      _loading = true;
      notifyListeners();
      _weather = await WeatherRepository.fetchWeather(lat, lon);
    } catch (e) {
      // Handle error
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLocation(String city, String country) async {
    try {
      _loading = true;
      notifyListeners();
      _weather = await _repository.fetchWeatherByLocation(city, country);
    } catch (e) {
      // Handle error
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
