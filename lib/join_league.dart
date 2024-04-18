// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/appbar.dart';
import 'widgets/league_list_body.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override 
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
      appBar: Appbar(title:"Leagues"),
      body: LeagueListBody(),
      ),
    );
  }
}