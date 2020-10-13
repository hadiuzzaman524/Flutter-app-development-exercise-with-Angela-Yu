import 'package:flutter/material.dart';
import 'screen1.dart';
import 'screen3.dart';
import 'screen2.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Screen3(),
      /*
      for handle multiple screen use this trick also
       */
      initialRoute: '/third',
      /*
      initialRoiute and home: are same if we use both then
      program will be confused..
       */
      /*
      routes:{} it a map and every key value take the parameter as a
      function and take input context..
       */
      routes: {
        '/':(context){ return Screen1();},
        '/first':(context){return Screen2();},
        '/third':(context){
         return Screen3();
        }
      },
    );
  }
}
