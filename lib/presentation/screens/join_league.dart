// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/league_list_body.dart';

class JoinLeagueScreen extends StatelessWidget {
  const JoinLeagueScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: Appbar(title: "Leagues"),
      body: LeagueListBody(),
    );
  }
}
