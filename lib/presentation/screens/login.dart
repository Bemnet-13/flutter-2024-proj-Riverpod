import 'dart:ui';
import '../widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/colors.dart';
import '../widgets/text_styles.dart';
import '../widgets/text_fields.dart';
import 'package:go_router/go_router.dart';
import '../../application/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);

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
                      "Login",
                      style: StyledText.loginStyle,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text(
                      "Please sign in to continue",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFieldWithIcon(
                      labelText: "EMAIL",
                      icon: Icons.email_outlined,
                      controller: _usernameController,
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
                  if (authState.isLoading)
                    Center(child: CircularProgressIndicator()),
                  if (authState.error != null)
                    Center(
                      child: Text(
                        authState.error!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: AuthButton(
                      buttonText: "LOGIN",
                      buttonColor: CustomColors.divider,
                      onPressed: () async {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        await authNotifier.login(username, password);

                        if (authState.token != null) {
                          context.go('/admin_dashboard');
                        }
                      },
                    ),
                  ),
                  const BottomText(
                    "Don't you have an account?",
                    "Sign Up",
                    '/signup',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
