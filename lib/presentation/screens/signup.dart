import 'dart:ui';

import '../widgets/buttons.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import '../widgets/chips.dart';
import '../widgets/colors.dart';
import '../widgets/text_styles.dart';
import '../widgets/text_fields.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                      "Signup",
                      style: StyledText.loginStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: RoleChoiceChip('Player', 'Admin'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFieldWithIcon("EMAIL", Icons.email_outlined),
                  TextFieldWithIcon("PASSWORD", Icons.lock_open_outlined),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthButton("SIGNUP ", CustomColors.divider),
                  const BottomText("Already have an account?", "Login")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
