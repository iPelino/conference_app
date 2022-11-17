import 'package:flutter/material.dart';

import '../themes/colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "TECH",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
              fontSize: 38,
              color: textColor),
        ),
        Text(
          "ME",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
              fontSize: 38,
              color: secondaryColor),
        ),
      ],
    );
  }
}
