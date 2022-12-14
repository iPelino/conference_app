import 'package:conference_app/screens/home_screen.dart';
import 'package:conference_app/screens/login_screen.dart';
import 'package:conference_app/screens/registration_screen.dart';
import 'package:conference_app/screens/speakers_screen.dart';
import 'package:conference_app/screens/splash_screen.dart';
import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConferenceApp());
}

class ConferenceApp extends StatelessWidget {
  const ConferenceApp({Key? key}) : super(key: key);

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
      home: SplashScreen(),
      routes: {
        'home': (context) => Home(),
        'login': (context) => Login(),
        'registration': (context) => Registration(),
        'speakers': (context) => SpeakerAll(),
      },
    );
  }
}
