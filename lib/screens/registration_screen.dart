import 'package:conference_app/themes/colors.dart';
import 'package:conference_app/widgets/app_title.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _key = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.textColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TitleWidget(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              // added to avoid Vertical viewport was given unbounded height error.
              child: ListView(
                children: [
                  RegistrationFormWidget(
                      myKey: _key,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      cPasswordController: cPasswordController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// refactored form into registration form widget
class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({
    Key? key,
    required GlobalKey<FormState> myKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.cPasswordController,
  })  : _key = myKey,
        super(key: myKey);

  final GlobalKey<FormState> _key;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController cPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: BrandColor.textColor,
                ),
                border: OutlineInputBorder(),
                hintText: "First Name",
                hintStyle: TextStyle(color: BrandColor.textColor),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'First name is required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: BrandColor.textColor,
                ),
                border: OutlineInputBorder(),
                hintText: "Last Name",
                hintStyle: TextStyle(color: BrandColor.textColor),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Last name is required!';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: BrandColor.textColor,
                ),
                border: OutlineInputBorder(),
                hintText: "Email",
                hintStyle: TextStyle(color: BrandColor.textColor),
              ),
              keyboardType: TextInputType.emailAddress,
              autofillHints: [AutofillHints.email],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'email is required';
                } else {
                  // Used email validator package
                  (!EmailValidator.validate(value))
                      ? 'enter a valid email address'
                      : null;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: BrandColor.textColor,
                ),
                border: OutlineInputBorder(),
                hintText: "Password",
                hintStyle: TextStyle(color: BrandColor.textColor),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'password is required!';
                } else {
                  if (value.length < 8)
                    return "password must at least 8 characters";
                  else
                    return null;
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: cPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: BrandColor.textColor,
                ),
                border: OutlineInputBorder(),
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: BrandColor.textColor),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'password is required!';
                } else {
                  if (value != passwordController.text) {
                    return "password mismatch";
                  } else {
                    return null;
                  }
                }
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(BrandColor.secondaryColor),
              ),
              // style: ElevatedButton.styleFrom(
              //     foregroundColor: Theme.of(context).highlightColor,
              //     backgroundColor: Theme.of(context).backgroundColor),
              onPressed: () {
                if (_key.currentState!.validate()) {}
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
