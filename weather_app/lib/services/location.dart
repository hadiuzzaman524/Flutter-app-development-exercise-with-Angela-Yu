import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  Future<void> setLocation() async {
    try {
      Position position =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print(e);
    }
  }


}