import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String btitle = 'USD';
  var onlineData;
  var onlineDataE;
  var base='BTC';
  var target;
  int rate=12808;
  var baseE='ETH';
  var targetE;
  int rateE=396;
  var bitCoin='BTC';

  getDataFromInternet() async {
   try {
     String url =
         'https://rest.coinapi.io/v1/exchangerate/BTC/$btitle?apikey=$apikey';
     http.Response response = await http.get(url);
     if (response.statusCode == 200) {
       print('Ok');
       onlineData = response.body;
     } else {
       print(response.statusCode);
     }
     print(onlineData);
     getInfoBTC();
   }catch(e){
     print(e);
   }
  }

  getDataFromInternetETH() async {
    try {
      String url =
          'https://rest.coinapi.io/v1/exchangerate/ETH/$btitle?apikey=$apikey';
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        print('Ok');
        onlineDataE = response.body;
      } else {
        print(response.statusCode);
      }
      print(onlineDataE);
      getInfoETH();
    }catch(e){
      print(e);
    }
  }

  getInfoBTC() {
    base = jsonDecode(onlineData)['asset_id_base'];
    target = jsonDecode(onlineData)['asset_id_quote'];
    var r = jsonDecode(onlineData)['rate'];
    rate=r.toInt();

    print(base);
    print(target);
    print(rate);
  }

  getInfoETH() {
    baseE = jsonDecode(onlineDataE)['asset_id_base'];
    targetE = jsonDecode(onlineDataE)['asset_id_quote'];
    var r = jsonDecode(onlineDataE)['rate'];
    rateE=r.toInt();
  }

  List<DropdownMenuItem> getDropDownItemAndroid() {
    List<DropdownMenuItem<String>> itemlist = [];
    for (String curency in curencyList) {
      var newItem = DropdownMenuItem(
        child: Text(curency),
        value: curency,
      );
      itemlist.add(newItem);
    }
    return itemlist;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromInternet();
    getDataFromInternetETH();
  }


  @override
  Widget build(BuildContext context) {
    getDataFromInternet();
    getDataFromInternetETH();
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
                      title: '1 $base -',
                      value: '$rate $btitle',
                    ),
                    CartItem(
                      title: '1 $baseE - ',
                      value: '$rateE $btitle',
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
                      items: getDropDownItemAndroid(),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          btitle = value;
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
