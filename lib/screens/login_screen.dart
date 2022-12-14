import 'package:conference_app/themes/colors.dart';
import 'package:conference_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      Navigator.pushNamed(
        context,
        'home',
      );

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
      // backgroundColor: BrandColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleWidget(
                    lightTheme: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SafeArea(
                    child: SvgPicture.asset(
                      'assets/images/login.svg',
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                        backgroundColor: BrandColor.primaryColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: BrandColor.secondaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: BrandColor.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, 'registration'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
