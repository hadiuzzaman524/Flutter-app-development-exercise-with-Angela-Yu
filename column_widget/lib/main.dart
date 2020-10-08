import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            /*
            mainAxisAlignment.center/start/end/spaceEvently/spaceBetween/ means the position of
            container in their parent.
             */
           // mainAxisSize: MainAxisSize.min,

            /*mainAxisSize.min means main container or column in
            wrap_content mode */

            crossAxisAlignment: CrossAxisAlignment.stretch,
            /*
            when crossAxisAlignment.stretch can be used then don't
            need to declare width in every container for column,
            when used row then don't need to declare height of
            every container..
             */

            children: [
              Container(
                height: 100.0,
                //width: 100.0,
                color: Colors.red,
                child: Center(child: Text('Container1')),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
              //  width: 100.0,
                color: Colors.blue,
                child: Center(child: Text('Container2')),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
               // width: 100.0,
                color: Colors.green,
                child: Center(child: Text('Container3')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
