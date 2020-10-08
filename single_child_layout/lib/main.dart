import 'package:flutter/cupertino.dart';
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
           /*
           EdgeInsets.all can be used margin in all side
            */
         //  margin: EdgeInsets.all(20),

          // margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
           /*
           EdgeInsets.fromLTRB means margin needed left,top,right,bottom
            */

           margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),

           /*
           EdgeInsets.symmetric can configure with horizontal and vertical margin
           in both side left-right,bottom-top
            */
           height: 100.0,
           width: 100.0,
           color: Colors.red,
           //padding: EdgeInsets.only(top: 50.0),
            padding: EdgeInsets.all(20.0),
           child: Text('Hello world'),
         ),
       ),
     ),
   );
  }

}