import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*
            CircleAvater hels us to build circular image

             */
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/hadi.jpg'),
              ),
              Text('Md.Hadiuzzaman',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Gochi Hand',
                  )),
              Text(
                'FLUTTER APP DEVELOPER',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Sansita Swashed',
                  color: Colors.white70,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  thickness: 5,
                  color: Colors.white,
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    Text(
                      '+88 01785304677',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              /*
              when we use Card widget it automatically gives us a rounded corner
              beautiful card, inside the Card the LisTile widget automatically gives us
              some padding with icon and title that's amazing.
               */
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                    ),
                    focusColor: Colors.red,
                    hoverColor: Colors.green,
                    title: Text(
                      'hadiuzzaman908@gmail.com',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
