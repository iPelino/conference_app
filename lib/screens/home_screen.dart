import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // final String username;
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.primaryColor,
        title: Text('Welcome $username'),
      ),
    );
  }
}
