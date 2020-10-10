import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  int randomImage=1;
  void pressButton(){

    setState(() {
      randomImage=Random().nextInt(5)+1;
      print('Click $randomImage');
    });

  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Random Image'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Expanded(
              child: FlatButton(
                child: Image.asset('images/ball$randomImage.png'),
                onPressed: pressButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
