import 'dart:ui';
import '../widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/colors.dart';
import '../widgets/text_styles.dart';
import '../widgets/text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              './assets/Fantasy_Ethiopia_Logo_Transparent.png',
              width: 350,
              height: 350,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text(
                      "Login",
                      style: StyledText.loginStyle,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text(
                      "Please sign in to continue",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const TextFieldWithIcon("EMAIL", Icons.email_outlined),
                  const TextFieldWithIcon("PASSWORD", Icons.lock_open_outlined),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthButton("LOGIN ", CustomColors.divider),
                  const BottomText("Don't you have an account?", "Sign Up")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
