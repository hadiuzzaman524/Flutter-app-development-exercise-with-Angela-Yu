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

  int leftDice=1;
  int rightDice=1;

  void diceChange(){
    setState(() {
      /*
       Random().nextInt(value is between 0 to n-1)
       we need 1-6 that's why add more 1.
       */
      leftDice=Random().nextInt(6)+1;
      rightDice=Random().nextInt(6)+1;
    });

  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dice Rolled'),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.green,
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: (){
                        print('Left button click');
                        diceChange();
                      },
                      child: Image.asset('images/dice$leftDice.png'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: (){
                        print('Right button click');
                        diceChange();
                      },
                      child: Image.asset('images/dice$rightDice.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
