import 'package:FantasyE/application/auth/manage_account/manage_account_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/buttons.dart';
import 'package:FantasyE/presentation/widgets/colors.dart';
import 'package:FantasyE/presentation/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return EditAccountForm();
  }
}

class EditAccountForm extends ConsumerWidget {
  const EditAccountForm();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editAccountState = ref.watch(manageAccountNotifierProvider);
    final editAccount = ref.read(manageAccountNotifierProvider.notifier);

    ref.listen(manageAccountNotifierProvider, (previous, next) {
      next.operationFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: failure.map(
                  cancelledByUser: (_) => const Text('Cancelled'),
                  serverError: (_) => const Text('Server Error'),
                  emailAlreadyInUse: (_) =>
                      const Text('Email Already In Use. Try another email'),
                  unsuccessfulDeletion: (_) =>
                      const Text('Unsuccessful deletion'),
                  invalidSuspension: (_) => const Text('Invalid suspension'),
                ),
              ),
            );
          },
          (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Account updated successfully'),
                action: SnackBarAction(
                  label: 'Go To Dashboard',
                  onPressed: () {
                    context.go('/splash');
                  },
                ),
              ),
            );
          },
        ),
      );
    });
    return Scaffold(
      appBar: CustomAppbar(
        title: "Edit Account",
        icon: Icons.arrow_back,
      ),
      body: Form(
        autovalidateMode: editAccountState.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FieldEntry(
              text: 'NAME',
              icon: Icons.person,
              isObscured: false,
              validatorCallback: (_) => editAccountState.name.value.fold(
                (f) => f.maybeMap(
                  invalidName: (_) => 'Short Name',
                  orElse: () => 'Please fill out the Name field',
                ),
                (_) => 'Please fill out the name field',
              ),
              onchangedCallback: (value) => editAccount.nameChanged(value),
            ),
            FieldEntry(
              text: 'EMAIL',
              icon: Icons.email_outlined,
              isObscured: false,
              validatorCallback: (_) =>
                  editAccountState.emailAddress.value.fold(
                (f) => f.maybeMap(
                  invalidEmail: (_) => 'Invalid Email',
                  orElse: () => 'Please fill out the Email field',
                ),
                (_) => '',
              ),
              onchangedCallback: (value) => editAccount.emailChanged(value),
            ),
            FieldEntry(
              text: 'PASSWORD',
              icon: Icons.lock_open_outlined,
              isObscured: true,
              validatorCallback: (_) => editAccountState.password.value.fold(
                (f) => f.maybeMap(
                  shortPassword: (_) => 'Short password',
                  orElse: () => 'Please fill out the Password field',
                ),
                (_) => 'Please fill out the Password field',
              ),
              onchangedCallback: (value) => editAccount.passwordChanged(value),
            ),
            FieldEntry(
              text: 'TEAM NAME',
              icon: Icons.group_add_sharp,
              isObscured: false,
              validatorCallback: (_) => editAccountState.teamName.value.fold(
                (f) => f.maybeMap(
                  invalidName: (_) => 'Short Team Name',
                  orElse: () => 'Please fill out the team name field',
                ),
                (_) => 'Please fill out the team name field',
              ),
              onchangedCallback: (value) => editAccount.teamNameChanged(value),
            ),
            AuthButton('DONE', CustomColors.accent, '/splash', true, () {
              editAccount.updateUserAccountPressed();
            })
          ],
        ),
      ),
    );
  }
}
