import 'package:faq/util/colors.dart';
import 'package:flutter/material.dart';

class CustmuBar extends StatelessWidget {
  final String title;
  const CustmuBar({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
          builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: CustomColors.lightPrimary,
                ),
              )),
      title: Text(
        title,
        style: const TextStyle(color: CustomColors.lightPrimary),
      ),
      centerTitle: true,
      backgroundColor: CustomColors.darkPrimary,
    );
  }
}
