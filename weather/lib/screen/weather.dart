import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:weather/utilities/constants.dart';

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
    weatherData = widget.weatherData;
    if (weatherData != null) {
      setWeather();

      print(ctName);
      print(temp);
      print(condition);
      print(description);
    }
  }

  setWeather() {
    ctName = jsonDecode(weatherData)['name'];
    var x = jsonDecode(weatherData)['main']['temp'];
    temp=x;
    condition = jsonDecode(weatherData)['weather'][0]['main'];
    description = jsonDecode(weatherData)['weather'][0]['description'];
  }

  @override
  Widget build(BuildContext context) {
    print(weatherData);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.all(20.0),
                    child: Text(temp.toString(),
                    style: textStyle,),
                  ),
                  Text(condition,
                  style: textCondition,),
                ],
              ),
              Container(
                height:60.0,
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icons.add_location_alt_sharp,
                        onPress: () {
                          print('click location');
                        },
                      ),
                      IconButton(
                        icon: Icons.search,
                        onPress: () {
                          print('click search');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  IconButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Icon(icon,color: Colors.white,size: 45,),
    );
  }
}
