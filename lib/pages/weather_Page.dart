import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/weather_tile_2.dart';
import '../controllers/weather_contoller.dart';
import '../utils/weather_tile_1.dart';

class HomePage extends StatelessWidget {
  final String locations;
  const HomePage({super.key, required this.locations});

  Widget getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return Image.asset('assets/images/thunder.png');
    } else if (code >= 300 && code < 400) {
      return Image.asset('assets/images/rain.png');
    } else if (code >= 500 && code < 600) {
      return Image.asset('assets/images/rainstorm.png');
    } else if (code >= 600 && code < 700) {
      return Image.asset('assets/images/snow.png');
    } else if (code >= 700 && code < 800) {
      return Image.asset('assets/images/mist.png');
    } else if (code == 800) {
      return Image.asset('assets/images/sun.png');
    } else if (code > 800 && code <= 804) {
      return Image.asset('assets/images/cloud.png');
    } else {
      return Image.asset('assets/images/coolbreez.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllers = Get.put(WeatherController());
    var location = controllers.getWeather(locations);

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
      body: FutureBuilder(
          future: location,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
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
                          decoration:
                              const BoxDecoration(color: Colors.deepOrange),
                        ),
                      ),
                      BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100),
                          child: Container()),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  '📍${snapshot.data.areaName.toUpperCase()}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
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
                              getWeatherIcon(
                                  snapshot.data.weatherConditionCode!),
                              Center(
                                child: Text(
                                  '${snapshot.data.temperature!.celsius.round()}℃',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 55,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Center(
                                child: Text(
                                  snapshot.data.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  DateFormat('EEEE dd •')
                                      .add_jm()
                                      .format(snapshot.data.date!),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherTile1(
                                    image: 'assets/images/sunicon.png',
                                    time: DateFormat()
                                        .add_jm()
                                        .format(snapshot.data.sunrise!),
                                    title: 'Sunrise',
                                  ),
                                  WeatherTile1(
                                    image: 'assets/images/moonicon.png',
                                    time: DateFormat()
                                        .add_jm()
                                        .format(snapshot.data.sunset!),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherTile2(
                                    image: 'assets/images/hottemp.png',
                                    subtitle:
                                        '${snapshot.data.tempMax!.celsius!.round().toString()} ℃',
                                    title: 'Temp max',
                                  ),
                                  WeatherTile2(
                                    image: 'assets/images/cooltemp.png',
                                    subtitle:
                                        '${snapshot.data.tempMin!.celsius!.round().toString()} ℃',
                                    title: 'Temp Min',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.deepOrange.shade100,
                ),
              );
            }
          }),
    );
  }
}
