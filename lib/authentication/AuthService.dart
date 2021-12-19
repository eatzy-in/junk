

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SignInScreen.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isUserLoggedIn() {
    return auth.currentUser != null ? true : false;
  }

  Future<UserCredential> signIn(AuthCredential authCredential) {
    return auth.signInWithCredential(authCredential);
  }

  Future<void> signOut() async {
    return auth.signOut();
  }

  void signOutAndRedirectToHomePage(BuildContext context) async {
    return auth.signOut().then((value) => {
          Navigator.of(context, rootNavigator: true).pop(context),
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          )
        });
  }
}