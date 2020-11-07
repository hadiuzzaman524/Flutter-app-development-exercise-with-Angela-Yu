import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Widget> potriatItem() {
    return [
      Container(
        color: Colors.red,
        height: 300,
      ),
      Container(
        height: 300,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    ];
  }

  List<Widget> landScapeItem() {
    return [
      Container(
        color: Colors.yellow,
        height: 100,
      ),
      Container(
        height: 200,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    bool orintation = (MediaQuery.of(context).orientation == Orientation.portrait);
    print('protiat:');
    print(orintation.toString());


    return SafeArea(
      child: Scaffold(
        body: Column(
          /*
          return different design with device orientation
           */
          children: orintation ? potriatItem() : landScapeItem(),
        ),
      ),
    );
  }
}
