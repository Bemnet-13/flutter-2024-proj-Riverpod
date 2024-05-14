import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'colors.dart';
import '../widgets/buttons.dart';

class DashboardCard extends StatelessWidget {
  final String navigateTo;
  final String buttonText;
  final String imagePath;
  final double imageWidth;
  final double imageHeight;

  const DashboardCard({super.key,required this.navigateTo, required this.buttonText,  required this.imagePath, required this.imageWidth, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 175,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 189, 189, 189),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: imageWidth,
            height: imageHeight,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          CardButton(buttonText, CustomColors.texColor, navigateTo),

        ],
      ),
    );
  }
}
