import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();
  static String apiKey = "Your api key";

  Future<Weather> getWeather(cityName) async {
    try {
      WeatherFactory wf = WeatherFactory(apiKey, language: Language.ENGLISH);
      Weather weather = await wf.currentWeatherByCityName(cityName);
      return weather;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getCurrentCity() async {
    //get permmision
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //convert the position to a list of placemark
    List<Placemark> placmarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //extract cityname from the first placemark
    String? cityname = placmarks[0].locality;

    return cityname ?? "";
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
