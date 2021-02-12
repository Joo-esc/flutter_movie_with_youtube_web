import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moview_web/controller/google_sign_in_controller.dart';

class LoginMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(GoogleSignInController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Main'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            loginController.login();
          },
          child: Card(
            child: Container(
                color: Colors.white30.withOpacity(0.9),
                padding: EdgeInsets.all(10),
                child: Text('카카오톡 로그인')),
          ),
        ),
      ),
    );
  }
}
