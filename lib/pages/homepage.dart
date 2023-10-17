import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherservice = WeatherService();
  Weather? _weather;
  fetchWeather() async {
    String cityName = await weatherservice.getCurrentCity();
    try {
      final weather = await weatherservice.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  String getWeatherCondition(String? mainCondition) {
    switch (mainCondition.toString().toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/mist.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
      case 'thunderstom':
        return 'assets/rain.json';
      case 'clear':
        return 'assets/sun.json';
      default:
        return 'assets/suncloud.json';
    }
  }

  @override
  void initState() {
    fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_weather?.cityName ?? "Loading City ...."),
              Lottie.asset(getWeatherCondition(_weather?.mainCondition)),
              Column(
                children: [
                  Text('${_weather?.temperature.round()} °C'),
                  Text(_weather?.mainCondition ?? ""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
