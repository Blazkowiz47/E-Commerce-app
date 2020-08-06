import 'package:flutter/material.dart';
import 'package:rtiggers/HomeScreen/HomeScreen.dart';
import 'package:rtiggers/LoginScreen/login.dart';
import 'package:rtiggers/Registration/details.dart';
import 'package:rtiggers/Registration/signature.dart';
import 'package:rtiggers/colors.dart';

import 'Authentication/authentication.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rtigger',
      theme: ThemeData(
        primarySwatch: blueColor,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: AuthService().handleAuth(),
        home: HomeScreen(),
    );
  }
}
