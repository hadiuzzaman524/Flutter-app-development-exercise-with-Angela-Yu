import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  getLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('need location permission');
    }
  }
}
