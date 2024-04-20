// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'widgets/admin_avatar_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: Appbar(title:"Avatars"),
        body:AdminAvatarListBody(),
        ),
    );
  }
}

