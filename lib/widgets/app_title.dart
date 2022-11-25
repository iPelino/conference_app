import 'package:flutter/material.dart';

import '../themes/colors.dart';

class TitleWidget extends StatelessWidget {
  final bool lightTheme;
  const TitleWidget({
    Key? key,
    this.lightTheme = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "TECH",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
              fontSize: 38,
              color:
                  // changes the 'TECH' text to primary color on light background
                  lightTheme ? BrandColor.primaryColor : BrandColor.textColor),
        ),
        Text(
          "ME",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
              fontSize: 38,
              color: BrandColor.secondaryColor),
        ),
      ],
    );
  }
}
