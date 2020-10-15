import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:judashop/secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WebApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: 100,right: 100,left: 100),
                child: Image.asset('images/applogo.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text('Your Biggest Shopping Mall',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF707070),
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text('Powered By juda.shop',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF707070),
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
