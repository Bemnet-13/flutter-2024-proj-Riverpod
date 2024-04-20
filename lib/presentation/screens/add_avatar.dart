// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/avatar_list_body.dart';
import '../widgets/appbar.dart';

class AddAvatarScreen extends StatelessWidget {
  const AddAvatarScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(title: "Avatars"),
        body: AvatarListBody(),
      ),
    );
  }
}
