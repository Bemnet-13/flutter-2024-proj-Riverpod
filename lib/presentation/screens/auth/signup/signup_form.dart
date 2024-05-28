import 'package:FantasyE/application/auth/auth_form/auth_provider.dart';
import '../../../widgets/colors.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/text_styles.dart';
import '../../../widgets/text_fields.dart';
import '../../../widgets/chips.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../../../application/auth/auth_form/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupForm = ref.read(signupFormNotifierProvider.notifier);
    final signUpFormState = ref.watch(signupFormNotifierProvider);

    ref.listen<SignupFormState>(signupFormNotifierProvider, (previous, next) {
      next.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: failure.maybeMap(
                    cancelledByUser: (_) => const Text('Cancelled'),
                    serverError: (_) => const Text('Server Error'),
                    emailAlreadyInUse: (_) =>
                        const Text('Email Already In Use. Try another email'),
                    invalidEmailAndPasswordCombination: (_) =>
                        const Text('Invalid Email or Password'),
                    invalidRoleUsedInLogin: (_) =>
                        const Text('Invalid Role. Use defined these roles'),
                    orElse: () =>
                        const Text("Could not sign you up. Try again.")),
              ),
            );
          },
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Registration successful'),
                action: SnackBarAction(
                  label: 'Go To Login',
                  onPressed: () {
                    context.go('/login');
                  },
                ),
              ),
            );
          },
        ),
      );
    });
    return SingleChildScrollView(
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                  child: RoleChoiceChip(),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Form(
                  autovalidateMode: signUpFormState.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      FieldEntry(
                          text: 'NAME',
                          icon: Icons.person_2_rounded,
                          isObscured: false,
                          validatorCallback: (_) => signUpFormState.name.value
                              .fold(
                                  (failure) => failure.maybeMap(
                                      invalidName: (_) => 'Invalid Name',
                                      orElse: () => 'Try again'),
                                  (r) => ''),
                          onchangedCallback: (value) {
                            signupForm.nameChanged(value);
                          }),
                      FieldEntry(
                          text: 'EMAIL',
                          icon: Icons.email_outlined,
                          isObscured: false,
                          validatorCallback: (_) =>
                              signUpFormState.emailAddress.value.fold(
                                  (failure) => failure.maybeMap(
                                      invalidEmail: (_) => 'Invalid Email',
                                      orElse: () => 'Try again'),
                                  (r) => ''),
                          onchangedCallback: (value) {
                            signupForm.emailChanged(value);
                          }),
                      FieldEntry(
                          text: 'PASSWORD',
                          icon: Icons.lock_open_outlined,
                          isObscured: true,
                          validatorCallback: (_) =>
                              signUpFormState.password.value.fold(
                                  (failure) => failure.maybeMap(
                                      shortPassword: (_) => 'Short Password',
                                      orElse: () => 'Try again'),
                                  (r) => ''),
                          onchangedCallback: (value) =>
                              signupForm.passwordChanged(value)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AuthButton("SIGNUP ", CustomColors.darkPrimary, '/login', false,
                    () => signupForm.registerWithEmailAndPasswordPressed()),
                const BottomText("Already have an account?", "Login", '/login')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
