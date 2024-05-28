import 'package:FantasyE/application/auth/auth_form/auth_provider.dart';
import 'package:FantasyE/application/auth/auth_logic/auth_logic_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/text_fields.dart';
import '../../../../application/auth/auth_form/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginAdmin extends ConsumerWidget {
  const LoginAdmin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoginFormAdmin();
  }
}

class LoginFormAdmin extends ConsumerWidget {
  const LoginFormAdmin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFormAdminNotifier = ref.read(loginFormNotifierProvider.notifier);
    final loginFormAdminState = ref.watch(loginFormNotifierProvider);
    final loginRequestedByUser = ref.read(authLogicNotifierProvider.notifier);

    ref.listen<LoginFormState>(loginFormNotifierProvider, (previous, next) {
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
                content: Text('Login Successful'),
                action: SnackBarAction(
                  label: 'Go To Dashboard',
                  onPressed: () {
                    context.go('/admin_dashboard');
                    loginRequestedByUser.loginRequestedAsAdmin();
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
                      "Login as an Admin",
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
                    autovalidateMode: loginFormAdminState.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        FieldEntry(
// static const text = 'EMAIL';
// static const IconData icon = Icons.email_outlined;
// static const isObscured = false;

                            text: 'EMAIL',
                            icon: Icons.email_outlined,
                            isObscured: false,
                            validatorCallback: (_) =>
                                loginFormAdminState.emailAddress.value.fold(
                                    (failure) => failure.maybeMap(
                                        invalidEmail: (_) => 'Invalid Email',
                                        orElse: () => 'Try again'),
                                    (r) => ''),
                            onchangedCallback: (value) {
                              loginFormAdminNotifier.emailChanged(value);
                            }),
                        FieldEntry(
                            text: 'PASSWORD',
                            icon: Icons.lock_open_outlined,
                            isObscured: true,
                            validatorCallback: (_) =>
                                loginFormAdminState.password.value.fold(
                                    (failure) => failure.maybeMap(
                                        shortPassword: (_) => 'Short Password',
                                        orElse: () => 'Try again'),
                                    (r) => ''),
                            onchangedCallback: (value) =>
                                loginFormAdminNotifier.passwordChanged(value)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AuthButton("LOGIN ", CustomColors.darkPrimary,
                      '/admin_dashboard', true, () {
                    // context.read<LoginFormBloc>().add(
                    // const LoginFormEvent
                    // .loginWithEmailAndPasswordPressed(),
                    // );
                    // context.read<AuthLogicBloc>().add(
                    // const AuthLogicEvent.loginRequestedAsAdmin(),
                    // );
                    loginFormAdminNotifier.roleSelected('ADMIN');
                    loginFormAdminNotifier.loginWithEmailAndPasswordPressed();
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
