// main.dart file
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:selling_meter_app/authentication/SignInScreen.dart';
import 'package:selling_meter_app/homePage.dart';

import '../Controller.dart';
import 'AuthService.dart';

class AuthSignIn extends StatefulWidget {
  const AuthSignIn({Key? key}) : super(key: key);

  @override
  _AuthSignInState createState() => _AuthSignInState();
}

class _AuthSignInState extends State<AuthSignIn> {

  @override
  Widget build(BuildContext context) {
    // we return the MaterialApp here ,
    // MaterialApp contain some basic ui for android ,
    return MaterialApp(
      //materialApp title
      title: 'The Royal Phular',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.mango),
      // The Mandy red, dark theme.
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.gold),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      // home property contain SignInScreen widget
      home: Auth().isUserLoggedIn() ? const ControllerWidget() : SignInScreen(),
    );
  }
}
