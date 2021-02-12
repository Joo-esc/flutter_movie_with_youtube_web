import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final googleSignIn = GoogleSignIn();
  bool _isSignIn;

  bool get isSignIn => _isSignIn;
  set isSignIn(bool value) {
    update();
    _isSignIn = value;
  }

  GoogleSignInController() {
    _isSignIn = false;
  }

  Future login() async {
    final _user = await googleSignIn.signIn();
    _isSignIn = true;
    if (_user == null) {
      return _isSignIn = false;
    } else {}
  }
}