

class Weather {
  final String location;
  final String condition;
  final double temperature;

  Weather({required this.location, required this.condition, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['name'],
      condition: json['weather'][0]['main'],
      temperature: (json['main']['temp'] - 273.15), // Convert temperature from Kelvin to Celsius
    );
  }
}


