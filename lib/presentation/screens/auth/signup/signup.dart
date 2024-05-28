import 'package:flutter/material.dart';
import '../../../widgets/colors.dart';
import 'signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.scaffoldBackground,
        body: SignUpForm());
  }
}
