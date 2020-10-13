
import 'package:bmi_calculator/all_designstyle.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
        centerTitle: true,
      ),
      body: Text('hello',
      style: kTextStyle,),
    );
  }
}
