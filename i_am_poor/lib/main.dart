import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alarm'),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightBlue,
            child:Center(
              child: Image(
                image: AssetImage('images/stopclock.png'),
              ),
            )
        ),
      ),
    );
  }

}
