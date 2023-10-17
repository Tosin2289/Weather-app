import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  final String locations;
  const HomePage({super.key, required this.locations});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherservice = WeatherService();
  Weather? _weather;
  fetchWeather(city) async {
    String cityName = await weatherservice.getCurrentCity();
    try {
      final weather = await weatherservice.getWeather(city);
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
    super.initState();
    fetchWeather(widget.locations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.locations,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              Lottie.asset(getWeatherCondition(_weather?.mainCondition)),
              Column(
                children: [
                  Text(
                    '${_weather?.temperature.round()} °C',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    _weather?.mainCondition ?? "",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
