import '../widgets/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFIeld extends StatelessWidget {
  final String label;
  final String hintText;
  const CustomTextFIeld({super.key, required this.label, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(
          label,
          style: const TextStyle(
            color: CustomColors.texColor,
            fontSize: 16,
          ),
        ),
        labelStyle: const TextStyle(
          color: CustomColors.texColor,
          fontSize: 18,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColors.subText,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.texColor,
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
