import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

void printHello() {
  try {
    final DateTime now = DateTime.now();
    final int isolateId = Isolate.current.hashCode;
    print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
    print('called');
  }
  catch(e){
    print('handel');
  }
}

 main() async {
  try {
    final int helloAlarmID = 0;
    await AndroidAlarmManager.initialize();
    runApp(MyApp());
    await AndroidAlarmManager.periodic(
        const Duration(minutes: 1), helloAlarmID, printHello);
  }catch(e){
    print('handel main');
  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
