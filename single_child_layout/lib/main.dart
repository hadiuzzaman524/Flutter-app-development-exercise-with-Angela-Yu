import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     home: Scaffold(
       /*
      SafeArea ব্যাবহার করার কারনে যেসব ডিভাইসে নচ আছে ডিজাইন সেইসব যায়গায় অভাররাইড হয়ে যায়,
      তাই সেভ ভাবে ডিজাইন করার জন্য SafeArea উইজেট ব্যাবহার করা হয়।
        */
       body: SafeArea(
         child: Container(
           child: Text('Hello world'),
         ),
       ),
     ),
   );
  }

}