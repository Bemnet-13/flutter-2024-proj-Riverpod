import 'package:FantasyE/presentation/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StyledText extends StatelessWidget {
  static const TextStyle faqStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  );
  static const TextStyle loginStyle =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 40.0);

  static const TextStyle welcomeScreenStyle = TextStyle(
      fontFamily: 'Allura',
      fontSize: 55,
      fontWeight: FontWeight.w600,
      color: Colors.white);
  static const TextStyle welcomeScreenBottomText =
      TextStyle(fontSize: 30, color: CustomColors.lightPrimary);

  static const TextStyle fantasyEthiopiaText = TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    letterSpacing: 6,
    fontFamily: 'Allura',
  );
  static const TextStyle drawerTestStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w900);

  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BottomText extends StatelessWidget {
  final String left;
  final String textButton;
  final String navigateTo;
  const BottomText(this.left, this.textButton, this.navigateTo);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          left,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0),
        ),
        TextButton(
          onPressed: () {
            context.go(navigateTo);
          },
          child: Text(
            textButton,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17.0),
          ),
        )
      ]),
    );
  }
}
