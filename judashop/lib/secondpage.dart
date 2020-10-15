import 'package:flutter/material.dart';
import 'homepage.dart';

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebApplication(),
    );
  }
}