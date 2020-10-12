import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cart_content.dart';
import 'cart_item.dart';

const Color mycolor = Color(0xFF1D1F33);
const Color inactive=Colors.black87;
const Color activecolor=Color(0xFF1D1F33);
const Color mybackground = Color(0xFF0A0D22);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Color inactivem=inactive;
  Color inactivef=inactive;

  void selectColor(bool flag){

    if(flag){
      inactivem=activecolor;
      inactivef=inactive;
    }
    if(!flag){
      inactivef=activecolor;
      inactivem=inactive;
    }
  }
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
                        child: GestureDetector(
                          onTap: (){
                            print('male');
                            setState(() {
                              selectColor(true);
                            });
                          },
                          child: BodyDesign(
                            mycolorp: inactivem,
                            newchild: ReusableContent(name: 'MALE',
                            myicon: FontAwesomeIcons.mars,),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            print('female');
                            setState(() {
                              selectColor(false);
                            });
                          },
                          child: BodyDesign(
                            mycolorp: inactivef,
                            newchild: ReusableContent(name: 'FEMALE',
                            myicon: FontAwesomeIcons.venus,),
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
                mycolorp: mycolor,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: BodyDesign(
                        mycolorp: mycolor,
                      ),
                    ),
                    Expanded(
                      child: BodyDesign(
                        mycolorp: mycolor,
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

