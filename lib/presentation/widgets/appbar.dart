// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  // ignore: use_super_parameters
  const Appbar({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  AppBar(
        backgroundColor: Colors.grey,
        leading: const Icon(Icons.menu, color: Colors.white),
        title:  Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        centerTitle: true,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
