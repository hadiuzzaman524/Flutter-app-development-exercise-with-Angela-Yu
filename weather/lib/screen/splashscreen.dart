import 'package:flutter/material.dart';

import 'package:weather/networking/Internet.dart';
import 'package:weather/screen/weather.dart';
import 'package:weather/networking/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double latitude;
  double longitude;
  var data;

  getCurrentLocationAndData() async {
    Location location = Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
    Internet internet = Internet(latitude: latitude, longitude: longitude);
    data = await internet.getDataFromInternet();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        weatherData: data,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocationAndData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: SpinKitWave(
            color: Colors.orangeAccent,
            size: 50.0,
          ),
        ),
      )
    );
  }
}
