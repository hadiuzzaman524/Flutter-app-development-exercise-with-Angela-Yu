import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String btitle='USA';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bit Coin tracker'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    CartItem(
                      title: btitle,
                      value: '44',
                    ),
                    CartItem(
                      title: btitle,
                      value: '44',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: Center(
                    child: DropdownButton(
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      value: btitle,
                      dropdownColor: Colors.black38,
                      iconEnabledColor: Colors.white,
                      items: [
                        DropdownMenuItem(
                          child: Text('USA'),
                          value: 'USA',
                        ),
                        DropdownMenuItem(
                          child: Text('URO'),
                          value: 'URO',
                        ),
                        DropdownMenuItem(
                          child: Text('TK'),
                          value: 'TK',
                        ),
                      ],
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          btitle=value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title;
  final String value;

  CartItem({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
