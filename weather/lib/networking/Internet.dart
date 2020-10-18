import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weather/utilities/constants.dart';
class Internet{
  double latitude;
  double longitude;
  Internet({@required this.latitude,@required this.longitude});

Future<dynamic>  getDataFromInternet() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api&units=metric');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('wrong connection');
    }

  }

}