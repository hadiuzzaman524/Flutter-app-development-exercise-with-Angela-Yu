import 'package:animation/secondscreen.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(MyApp());
  runApp(MySecondApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{

  //declare global variable AnimationController
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController=AnimationController(
      /*
      AnimationController's required parameter is vsync: vsync is e ticker ,
      ticker looks like e watch's tik tik in every second value, for using
      ticker uses with TickerProviderStateMixin and finally use vsync:this.
       */
      duration: Duration(seconds: 5),
      vsync: this,
      /*
      Bydefault upperBound 1 , and lowerBound 0
       */
    );
    /*
    animation=CurvedAnimation(parent: animationController,curve: Curves.decelerate);
    use this line for different animation style...
*/
    /*
    animationController.forward() can incrase vale in forward direction between
    0 and 1
     */

    animationController.forward();

    /*
    using AnimationController addListener we can detect value of change by animationController
     */
    animationController.addListener(() {
      print(animationController.value);
      print(animation.value);
      /*
      uses setState here because every changing time rebuild our widget for
      showing animations
       */
      setState(() {
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.white, //Colors.red.withOpacity(animationController.value),
        body: Container(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                /*
                change logo height width with animations
                 */
                height: animationController.value,
                width: animationController.value,
                child: Image.asset('images/man.png'),
              ),
              Text(
                 '${animationController.value.toInt()}%',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
