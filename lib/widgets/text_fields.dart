import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class TextFieldWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  const TextFieldWithIcon(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 20.0),
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
        ),
      ),
    );
  }
}
