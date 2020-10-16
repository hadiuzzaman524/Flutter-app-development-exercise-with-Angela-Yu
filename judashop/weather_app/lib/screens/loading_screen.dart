import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getCurrentLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: FlatButton(
            color: Colors.red,
            padding: EdgeInsets.all(20.0),
            onPressed: () {
              getCurrentLocation();
            },
            child: Text('Get Location'),
          ),
        ),
      ),
    );
  }
}
