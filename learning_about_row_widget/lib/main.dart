import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          // useing for all container in center
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
             // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.red,
                  child: Center(child: Text('Container 1')),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                  child: Center(child: Text('Container 1')),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.green,
                  child: Center(child: Text('Container 1')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}