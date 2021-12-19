import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:selling_meter_app/homePage.dart';
import 'authentication/AuthSignIn.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AuthSignIn());
}