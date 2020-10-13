import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            /*
            Navigator.push looks like a stack every time we push screen as
            root in Navigator.
             */
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Screen2();
                },
              ),
            );
          },
          child: Container(
            child: Text('screen 2'),
            color: Colors.green,
            padding: EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}
