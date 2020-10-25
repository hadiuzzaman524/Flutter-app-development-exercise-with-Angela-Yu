
import 'package:flutter/material.dart';

class MySecondApp extends StatefulWidget {
  @override
  _MySecondAppState createState() => _MySecondAppState();
}

class _MySecondAppState extends State<MySecondApp> with TickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {

    super.initState();
    animationController=AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animationController.forward();
    //animation=CurvedAnimation(parent: animationController,curve: Curves.decelerate);

    /*
    ColorTween makes animation between two colors
     */
    animation=ColorTween(begin: Colors.grey,end: Colors.white).animate(animationController);

    /*
    animation.addStatusListener return status of the animation
    if animation will be in forward direction and it finish then
    return status completed , and if animation is in reverse direction
    and when it finished then return statusCode dismissed, for infinitely
    running animation we can goes forward and backword direction using
    this piece of code.
     */

/*    animation.addStatusListener((status) {
      if(AnimationStatus.completed==status){
        animationController.reverse(from: 1);
      }
      else if(AnimationStatus.dismissed==status){
        animationController.forward();
      }
    });*/

    animationController.addListener(() {
      setState(() {
      });
      print(animationController.value);
    });

    print(animation.status);
  }

  /*
  when the screen close that time dispose function is automatically
  called and close the animationController for saving more works../ or
  save battery power.
   */

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:animation.value, //Colors.red.withOpacity(animationController.value),
        body: Container(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                /*
                change logo height width with animations
                 */
                height:100,
                width: 100,
                child: Image.asset('images/man.png'),
              ),
              Text(
                'Easy chat',
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
