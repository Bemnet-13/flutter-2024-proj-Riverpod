import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  CustomButton(this.buttonText, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(200.0, 0, 10, 0),
      child: ElevatedButton(
        onPressed: () => null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class AuthButton extends CustomButton {
  AuthButton(super.buttonText, super.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(240.0, 0, 10, 0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/player_dashboard'),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class RightAlignedButton extends CustomButton {
  RightAlignedButton(super.buttonText, super.buttonColor);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text(" "), CustomButton("Add players", CustomColors.accent)],
    );
  }
}
