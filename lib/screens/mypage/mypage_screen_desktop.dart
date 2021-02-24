import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPageDesktop extends StatelessWidget {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: CircleAvatar(
            backgroundImage: NetworkImage(_user.photoURL),
          ),
        ),
      ),
    );
  }
}
