import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final String navigateTo;
  CustomButton(this.buttonText, this.buttonColor, this.navigateTo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, navigateTo),
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
  AuthButton(super.buttonText, super.buttonColor, super.navigateTo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(" "),
        ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, super.navigateTo),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
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
      ],
    );
  }
}

class RightAlignedButton extends CustomButton {
  RightAlignedButton(super.buttonText, super.buttonColor, super.navigateTo);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text(" "), CustomButton("Add players", CustomColors.accent, super.navigateTo)],
    );
  }
}


class CardButton extends CustomButton {

  CardButton(super.buttonText, super.buttonColor, super.navigateTo);
  Widget build(BuildContext context) {
      return ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, navigateTo),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
      );
    }
  }