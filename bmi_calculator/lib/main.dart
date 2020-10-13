import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'all_designstyle.dart';
import 'cart_content.dart';
import 'cart_item.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum Gender {
  male,
  female,
}

class _MyAppState extends State<MyApp> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: mybackground,
          appBarTheme: AppBarTheme(
            color: mybackground,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        /*
                        GestureDetector look like a FlatButton difference that
                        FlatButton have default margin,padding and it's change our
                        design, but GestureDetector can not change our main design.
                         */
                        child: BodyDesign(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          mycolorp: selectedGender == Gender.male
                              ? activecolor
                              : inactivecolor,
                          newchild: ReusableContent(
                            name: 'MALE',
                            myicon: FontAwesomeIcons.mars,
                          ),
                        ),
                      ),
                      Expanded(
                        child: BodyDesign(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          mycolorp: selectedGender == Gender.female
                              ? activecolor
                              : inactivecolor,
                          newchild: ReusableContent(
                            name: 'FEMALE',
                            myicon: FontAwesomeIcons.venus,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: BodyDesign(
                newchild: Column(
                  children: [
                    Text('HELLO',
                    style: textStyle,),
                  ],
                ),
                mycolorp: activecolor,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: BodyDesign(
                        mycolorp: activecolor,
                      ),
                    ),
                    Expanded(
                      child: BodyDesign(
                        mycolorp: activecolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                ))
          ],
        ),
      ),
    );
  }
}
