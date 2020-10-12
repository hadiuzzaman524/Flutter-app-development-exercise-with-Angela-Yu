import 'package:flutter/material.dart';


class BodyDesign extends StatelessWidget {
  BodyDesign({@required this.mycolorp, this.newchild});

  final Color mycolorp;
  final Widget newchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: mycolorp,
      ),
      child: newchild,
    );
  }
}
