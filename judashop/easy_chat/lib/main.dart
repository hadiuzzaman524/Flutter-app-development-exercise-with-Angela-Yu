import 'package:easy_chat/chat.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'registration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      make every class has static keyword id thats why we
      directly used id using class name..
       */
      initialRoute:Home.id,
      routes: {
        Home.id: (context) => Home(),
        Login.id: (context) => Login(),
        Registration.id: (context) => Registration(),
        Chat.id: (context) => Chat(),
      },
    );
  }
}
