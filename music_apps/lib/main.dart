import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void playSounds(int number){
    final player=AudioCache();
    player.play('note$number.wav');
  }

  Expanded draw(int number,Color color){
   return Expanded(
      child: FlatButton(
          color: color,
          onPressed: (){
            playSounds(number);
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              draw(1, Colors.red),
              draw(2, Colors.brown),
              draw(3, Colors.pink),
              draw(4, Colors.orange),
              draw(5, Colors.yellow),
              draw(6, Colors.blue),
              draw(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
