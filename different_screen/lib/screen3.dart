import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen 3'),
      ),
      body: Column(
        children: [
          Center(
            child: FlatButton(
              onPressed: () {

                /*
                if we create map for navigation then use
                navigator.pushname( context, and the name of the key)
                 */
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                child: Text('screen 1'),
                color: Colors.red,
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
              child: Container(
                child: Text('screen 2'),
                color: Colors.yellow,
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
