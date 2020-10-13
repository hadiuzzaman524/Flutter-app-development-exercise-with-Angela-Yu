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

  int height = 80;
  int weight = 30;
  int age=15;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kMyBackgroundColor,
          appBarTheme: AppBarTheme(
            color: kMyBackgroundColor,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              ? kActiveColor
                              : kInactiveColor,
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
                              ? kActiveColor
                              : kInactiveColor,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      // need for change slider custom property, like
                      // ovelycolor,thumbshape,ovelyshape etc.
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.white,
                        activeTickMarkColor: Colors.pink,
                        thumbColor: Colors.pink,
                        // overlayColor: Colors.pinkAccent,
                        // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                        // overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 60,
                        max: 120,
                        activeColor: Colors.pink,
                        inactiveColor: Colors.blueGrey,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });

                          print(newvalue);
                        },
                      ),
                    )
                  ],
                ),
                mycolorp: kActiveColor,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: BodyDesign(
                        mycolorp: kActiveColor,
                        newchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: BodyDesign(
                        mycolorp: kActiveColor,
                        newchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: kTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  backgroundColor: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: (){
                    print('click');
                  },
                  child: Container(
                    color: Color(0xFFEB1555),
                    margin: EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text('CALCULATE YOUR BMI',
                      style: kTextStyle,),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
