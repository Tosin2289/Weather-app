import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static const Base_url = "https://api.openweathermap.org/data/2.5/weather";
  String apiKey = "7a403d8066027a448738bea94939051d";

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$Base_url?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  
}
