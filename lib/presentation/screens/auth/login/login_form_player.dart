import 'package:FantasyE/application/auth/auth_form/auth_provider.dart';
import 'package:FantasyE/application/auth/auth_logic/auth_logic_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPlayer extends StatelessWidget {
  const LoginPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginFormPlayer();
  }
}

class LoginFormPlayer extends ConsumerWidget {
  const LoginFormPlayer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormPlayerNotifier =
        ref.read(loginFormNotifierProvider.notifier);
    final loginFormState = ref.watch(loginFormNotifierProvider);
    final loginRequestedByUser = ref.read(authLogicNotifierProvider.notifier);

    ref.listen(loginFormNotifierProvider, (previous, next) {
      next.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: failure.map(
                  cancelledByUser: (_) => const Text('Cancelled'),
                  serverError: (_) => const Text('Server Error'),
                  emailAlreadyInUse: (_) =>
                      const Text('Email Already In Use. Try another email'),
                  invalidEmailAndPasswordCombination: (_) =>
                      const Text('Invalid Email or Password'),
                  invalidRoleUsedInLogin: (_) =>
                      const Text('Invalid Role. Use defined these roles'),
                  accountSuspended: (_) =>
                      const Text("Your account has been suspended"),
                ),
              ),
            );
          },
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Login successful'),
                action: SnackBarAction(
                  label: 'Go To Dashboard',
                  onPressed: () {
                    context.go('/player_dashboard');
                    loginRequestedByUser.loginRequestedAsPlayer();
                  },
                ),
              ),
            );
          },
        ),
      );
    });
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackground,
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
                      "Login as a Player",
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
                  Form(
                    autovalidateMode: loginFormState.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        FieldEntry(
                            text: 'EMAIL',
                            icon: Icons.email_outlined,
                            isObscured: false,
                            validatorCallback: (_) =>
                                loginFormState.emailAddress.value.fold(
                                    (failure) => failure.maybeMap(
                                        invalidEmail: (_) => 'Invalid Email',
                                        orElse: () => 'Try again'),
                                    (r) => ''),
                            onchangedCallback: (value) {
                              loginFormPlayerNotifier.emailChanged(value);
                            }),
                        FieldEntry(
                            text: 'PASSWORD',
                            icon: Icons.lock_open_outlined,
                            isObscured: true,
                            validatorCallback: (_) =>
                                loginFormState.password.value.fold(
                                    (failure) => failure.maybeMap(
                                        shortPassword: (_) => 'Short Password',
                                        orElse: () => 'Try again'),
                                    (r) => ''),
                            onchangedCallback: (value) =>
                                loginFormPlayerNotifier.passwordChanged(value)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthButton("LOGIN ", CustomColors.darkPrimary,
                      '/admin_dashboard', true, () {
                    loginFormPlayerNotifier.roleSelected('PLAYER');
                    loginFormPlayerNotifier.loginWithEmailAndPasswordPressed();
                  }),
                  const BottomText(
                      "Don't you have an account?", "Sign Up", '/signup')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
