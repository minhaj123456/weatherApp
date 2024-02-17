import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whetherapp/whether.dart';
// import 'package:your_app/models/weather.dart';

class WeatherRepository {
  static Future<Weather> fetchWeather(double lat, double lon) async {
    final apiKey = 'd134014162cf538590e8c45c29824141'; // Replace 'your_api_key' with your actual API key
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }

  fetchWeatherByLocation(String city, String country) {}
}
