import 'package:flutter/material.dart';
import 'data/league_list_data.dart';
import 'entries/league_list_entry.dart';

class LeagueListBody extends StatelessWidget{
  LeagueListBody({super.key});
  final league = LeagueListData().leaguelistdata;
  @override 
  Widget build(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
          child: Center(
            child: Text(
              'Join Leagues to compete with fellow contestants!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        Expanded(child: 
          
          ListView.builder(
            
            itemCount: league.length,
            itemBuilder: (context, index){
              return LeagueListEntry(
                index:index,
                leaguelist: league,
              );
            }
            )
        ),
      ],
    );
  }
}