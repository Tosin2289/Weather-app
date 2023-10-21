import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();
  String apiKey = "7a403d8066027a448738bea94939051d";

  // Future<String> getCurrentCity() async {
  //   //get permmision
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }
  //   // fetch current location
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   //convert the position to a list of placemark
  //   List<Placemark> placmarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   //extract cityname from the first placemark
  //   String? cityname = placmarks[0].locality;

  //   return cityname ?? "";
  // }
}
