import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  static const TextStyle faqStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
  );
  static const TextStyle loginStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 40.0
  );

  const StyledText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BottomText extends StatelessWidget {
  final String left;
  final String textButton;
  const BottomText(this.left, this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( left ,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0
              ),
            ),
            TextButton(onPressed: (){},
              child: Text(textButton,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17.0
                ),
              ),
            )
          ]
      ),
    );
  }
}
