import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/utils/weather_tile_2.dart';

import '../utils/weather_tile_1.dart';

class HomePage extends StatefulWidget {
  final String locations;
  const HomePage({super.key, required this.locations});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final weatherservice = WeatherService();
  // Weather? _weather;
  // fetchWeather(city) async {
  //   String cityName = await weatherservice.getCurrentCity();
  //   try {
  //     final weather = await weatherservice.getWeather(city);
  //     setState(() {
  //       _weather = weather;
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // String getWeatherCondition(String? mainCondition) {
  //   switch (mainCondition.toString().toLowerCase()) {
  //     case 'clouds':
  //       return 'assets/cloud.json';
  //     case 'mist':
  //     case 'smoke':
  //     case 'haze':
  //     case 'dust':
  //     case 'fog':
  //       return 'assets/mist.json';
  //     case 'rain':
  //     case 'drizzle':
  //     case 'shower rain':
  //     case 'thunderstom':
  //       return 'assets/rain.json';
  //     case 'clear':
  //       return 'assets/sun.json';
  //     default:
  //       return 'assets/suncloud.json';
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchWeather(widget.locations);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(6, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-8, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Colors.orange),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100),
                  child: Container()),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        '📍Fate-Ilorin',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Good day',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/images/rain.png'),
                    const Center(
                      child: Text(
                        '21℃',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Thunderstorm'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Center(
                      child: Text(
                        'Friday 16 • 09.41am',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        WeatherTile1(
                          image: 'assets/images/sunicon.png',
                          time: '5:34 am',
                          title: 'Sunrise',
                        ),
                        WeatherTile1(
                          image: 'assets/images/moonicon.png',
                          time: '5:34 pm',
                          title: 'Sunset',
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(
                        color: Colors.transparent,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        WeatherTile2(
                          image: 'assets/images/hottemp.png',
                          subtitle: '12℃',
                          title: 'Temp min',
                        ),
                        WeatherTile2(
                          image: 'assets/images/cooltemp.png',
                          subtitle: '8℃',
                          title: 'Temp Max',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
