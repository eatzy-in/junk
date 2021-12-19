

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Controller.dart';
import '../homePage.dart';
import 'AuthService.dart';

class GoogleAuth {

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    // Getting users credential
    UserCredential result = await Auth().signIn(authCredential);

    if (result != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ControllerWidget()));
    }
  }
}
