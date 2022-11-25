import 'package:conference_app/screens/home_screen.dart';
import 'package:conference_app/screens/login_screen.dart';
import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ConferenceApp());
}

class ConferenceApp extends StatelessWidget {
  ConferenceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conference App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness
        brightness: Brightness.light,
        primaryColor: BrandColor.primaryColor,
        backgroundColor: BrandColor.primaryColor,
        fontFamily: 'Poppins',
      ),
      home: Login(),
      routes: {'home': (context) => Home()},
    );
  }
}
