import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEDEDED),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('images/messenger.png'),
                  ),
                  Text(
                    'Easy Chat',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  ButtonDesign(
                    title: 'Log In',
                    onClick: () {
                      print('click login');
                    },
                  ),
                  ButtonDesign(
                    title: 'Sign Up',
                    onClick: () {
                      print('click signup');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Text('Powered By Hadi',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Pacifico',
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonDesign extends StatelessWidget {
  ButtonDesign({@required this.title, @required this.onClick});

  final String title;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
