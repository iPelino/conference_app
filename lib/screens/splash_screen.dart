import 'dart:async';

import 'package:conference_app/themes/colors.dart';
import 'package:conference_app/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, 'login');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView(
          children: [
            TitleWidget(),
            Center(
              child: Text(
                style: TextStyle(
                  color: BrandColor.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                "Accelerating Tech with confidence",
              ),
            ),
            //TODO: add package to render svg images or add image with no background
            SvgPicture.asset('assets/images/conference.svg'),
          ],
        ),
      ),
    );
  }
}
