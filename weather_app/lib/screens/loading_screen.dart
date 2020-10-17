import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const api = '02516232aba209c477af10b53ca7373a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;
  String ctname='jaman';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Location location = Location();
    await location.setLocation();
/*
 await তার নিচের সব কোডকে থামিয়ে রাখে , তাদের বলে যে তোমরা থাম আমি
 কাজ শেষ করে আসি তারপর তোমরা কাজ করবা, তা না হলে নিচের কেউ কাজ করতে
 পারবে না। তাই setLocation(); ফাংশন কে ফিউচার ডিফাইন করা হয়েছে...
 */
   latitude=location.latitude;
   longitude=location.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api');
    if (response.statusCode == 200) {

      /*
     statuscode 200 means connection ok
     statuscode 400 means connection error
      */
      String msg = response.body;

      /*
     get data from json using jsonDecode(). [] is path
     if have many path then declare [][][].. etc.
      */
      var decode=jsonDecode(msg);

      var name=decode['name'];
      print('output');
      print(name);
      ctname=name;

    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Text(ctname,
        style: TextStyle(
          fontSize: 25,
          color: Colors.black
        ),),
      ),
    );
  }
}
