import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/auth_form/auth_notifier.dart';

class FieldEntry extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function(String value)? onchangedCallback;
  final String Function(String? _)? validatorCallback;
  //  = Icons.person_2_rounded;
  final bool isObscured;
  const FieldEntry(
      {required this.text,
      required this.icon,
      required this.isObscured,
      required this.validatorCallback,
      required this.onchangedCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: SizedBox(
        width: 350,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: text,
            prefixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(
                icon,
              ),
            ),
          ),
          // initialValue: ,
          obscureText: isObscured,
          onChanged: onchangedCallback,
          validator: validatorCallback,
        ),
      ),
    );
  }
}
