import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){

            Navigator.pop(context);
          },
          child: Container(
            child: Text(
                'screen 1'
            ),
            color: Colors.blue,
            padding: EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}
