import 'package:FantasyE/application/auth/auth_form/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth_form/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoleChoiceChip extends StatelessWidget {
  static const String role1 = 'PLAYER';
  static const String role2 = 'ADMIN';
  static const roles = [role1, role2];

  @override
  Widget build(BuildContext context) {
    return const ChooseRole(
      roles: roles,
    );
  }
}

class ChooseRole extends ConsumerStatefulWidget {
  final List<String> roles;
  const ChooseRole({required this.roles});

  @override
  ConsumerState<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends ConsumerState<ChooseRole> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    final signupForm = ref.read(signupFormNotifierProvider.notifier);
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 155,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Create Account',
            style: textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('As', style: textTheme.headlineSmall),
          Wrap(
            spacing: 10.0,
            children: List<Widget>.generate(
              widget.roles.length,
              (int index) {
                return ChoiceChip(
                  label: Text(widget.roles[index]),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : 0;
                      if (selected) {
                        signupForm.chipSelected(widget.roles[index]);
                        // context.read<SignupFormBloc>().add(
                        // SignupFormEvent.chipSelected(widget.roles[index]));
                      }
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
