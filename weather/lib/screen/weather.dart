import 'package:flutter/material.dart';
import 'dart:convert';
class WeatherScreen extends StatefulWidget {
  var weatherData;

  WeatherScreen({@required this.weatherData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  var weatherData;
  var ctName;
  var temp;
  var condition;
  var description;

  @override
  void initState() {
    super.initState();
    weatherData=widget.weatherData;
    setWeather();

    print(ctName);
    print(temp);
    print(condition);
    print(description);

  }
  setWeather(){
    ctName=jsonDecode(weatherData)['name'];
    temp=jsonDecode(weatherData)['main']['temp'];
    condition=jsonDecode(weatherData)['weather'][0]['main'];
    description=jsonDecode(weatherData)['weather'][0]['description'];

  }

  @override
  Widget build(BuildContext context) {
    print(weatherData);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('')
          ],
        ),

      ),
    );
  }
}
