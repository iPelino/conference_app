import 'package:conference_app/themes/colors.dart';
import 'package:conference_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

import '../widgets/app_title.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void login(context) {
    // check form validation
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // navigate to home screen upon successful login
      // option 1

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => Home(username: usernameController.text)),
      // );

      // option 2: named routes
      // Navigator.pushNamed(
      //   context,
      //   'home',
      //   arguments: '${usernameController.text}',
      // );

      // Option 3: pushReplacement
      Navigator.pushReplacementNamed(
        context,
        'home',
        arguments: '${usernameController.text}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleWidget(
                  // lightTheme: true,
                  ),
              SizedBox(
                height: 40,
              ),
              LoginTextField(
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username is required";
                  }
                  return null;
                },
                hintText: 'Enter your username',
              ),
              SizedBox(
                height: 30,
              ),
              LoginTextField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                hintText: 'enter your password',
                hasHiddenChars: true,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  login(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: BrandColor.secondaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
