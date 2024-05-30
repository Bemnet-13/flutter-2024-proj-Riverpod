import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AddAvatarScreen extends StatelessWidget {
  const AddAvatarScreen({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
      appBar: CustomAppbar(
        title: "Avatars",
        icon: Icons.menu,
      ),
      //body: LeagueListBody(),
    );
  }
}
