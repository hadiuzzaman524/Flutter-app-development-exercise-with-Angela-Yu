import 'package:flutter/material.dart';
import 'package:bit_coin_tracker/mainpage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.red,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
