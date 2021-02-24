import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moview_web/controller/google_sign_in_controller.dart';
import 'package:moview_web/main.dart';

class LoginMain extends StatelessWidget {
  static String id = '/LoginMain';
  @override
  Widget build(BuildContext context) {
    // Get.toNamed("/LoginMain");

    final loginController = Get.put(GoogleSignInController());
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (loginController.isSignIn) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // Get.offAllNamed("/MyApp");
            return MainScreen();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Login Main'),
              ),
              body: Center(
                child: Column(
                  children: [
                    GestureDetector(
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
                    GestureDetector(
                      onTap: () {
                        loginController.logout();
                      },
                      child: Card(
                        child: Container(
                            color: Colors.white30.withOpacity(0.9),
                            padding: EdgeInsets.all(10),
                            child: Text('로그아웃')),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
