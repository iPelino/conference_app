import 'package:conference_app/themes/colors.dart';
import 'package:conference_app/widgets/app_title.dart';
import 'package:flutter/material.dart';

class AppIntroWidget extends StatelessWidget {
  const AppIntroWidget({
    Key? key,
  }) : super(key: key);

  @override
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
            Image(
              image: AssetImage("assets/images/conference.png"),
            ),
          ],
        ),
      ),
    );
  }
}
