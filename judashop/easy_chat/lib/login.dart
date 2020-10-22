import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class Login extends StatelessWidget {
  static const String id = 'login_page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('images/b.png'),
                  ),
                  tag: 'icon',
                ),
                Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                MyTextField(
                  textHint: 'Your email',
                  onChange: (value) {
                    print(value);
                  },
                ),
                MyTextField(
                  textHint: 'Password',
                  onChange: (value) {
                    print(value);
                  },
                ),
                ButtonDesign(
                  title: 'Log In',
                  onClick: () {
                    print('log in page');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
