//SignInScreen

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'GoogleAuth.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: Card(
          margin: EdgeInsets.only(top: 200, bottom: 200, left: 30, right: 30),
          elevation: 20,
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/royal_phular.png",
                fit: BoxFit.scaleDown,
              ),
              const Text(
                "The Royal Phular",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ), SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  GoogleAuth().signup(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
