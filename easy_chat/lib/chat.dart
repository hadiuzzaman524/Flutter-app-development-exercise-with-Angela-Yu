import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';

class Chat extends StatefulWidget {
  static const id = 'chat_page';

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User logInUser;

  getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        logInUser = user;
      }
    } catch (e) {
      print(e);
    }

    print(logInUser.email);
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
