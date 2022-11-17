import 'package:conference_app/themes/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  void login() {
    if (usernameController.text.isNotEmpty &&
        usernameController.text.length > 4) {
      print("success");
    } else {
      print("fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TitleWidget(),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Enter your username",
                hintStyle: TextStyle(color: textColor),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: textColor),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 24,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              splashColor: textColor,
              onTap: () {
                print("text tapped");
              },
              onLongPress: () {
                print("long pressed");
              },
              child: Text("This is a test"),
            ),
          ],
        ),
      ),
    );
  }
}
