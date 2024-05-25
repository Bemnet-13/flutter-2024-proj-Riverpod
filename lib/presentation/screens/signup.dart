import 'dart:ui';

import '../widgets/buttons.dart';
import 'package:flutter/material.dart';
import '../widgets/chips.dart';
import '../widgets/colors.dart';
import '../widgets/text_styles.dart';
import '../widgets/text_fields.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  topRight: Radius.circular(40),
                ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFieldWithIcon(
                      labelText: "EMAIL",
                      icon: Icons.email_outlined,
                      controller: _emailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFieldWithIcon(
                      labelText: "PASSWORD",
                      icon: Icons.lock_open_outlined,
                      obscureText: true,
                      controller: _passwordController,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: AuthButton(
                      buttonText: "SIGNUP",
                      buttonColor: CustomColors.divider,
                      onPressed: () {
                        // Handle signup logic here
                      },
                    ),
                  ),
                  const BottomText(
                    "Already have an account?",
                    "Login",
                    '/login',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
