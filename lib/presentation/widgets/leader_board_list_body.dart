// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'data/leader_board_list_data.dart';


class LeaderBoardListBody extends StatelessWidget{
    const LeaderBoardListBody({super.key});

    @override
    Widget build(context){

      final leaguelist = LeaderBoardListData().leaderboardlist;
      return Padding(
        padding:EdgeInsets.symmetric(horizontal:16),
        child:Table( 
        // border:TableBorder.all(),
        children: [
          TableRow(
            decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 2),)
        ),
          children: const [
            TableCell(
              child: Padding(
                padding:EdgeInsets.all(16),
                child:Center(child:Text(
                'Rank',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,),
                
              )),
              )
            ), 
            Padding(
                padding:EdgeInsets.all(16),
                child: Center(child:Text(
                'Player',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,)),
                
              ),
            ),
            Padding(
                padding:EdgeInsets.all(16),
                child:Center(child:Text(
                'Score',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32,),
                
              ),)
            ),
          ],
        ),
        ...List.generate(
          leaguelist.length,
          (index) => TableRow(
            
          decoration: BoxDecoration(
            border: Border(
            bottom: BorderSide(color: Colors.grey, width: 1,),),),
          children: [

              Padding(
                padding:EdgeInsets.all(16),
                child:Center(child:Text((index + 1).toString(), style: TextStyle(color:Colors.grey, fontSize: 24,),))),
              Padding(
                padding:EdgeInsets.all(8),
                child:Center(child:Text(leaguelist[index].playername, style: TextStyle(color:Colors.grey, fontSize: 24),))),
              Padding(
                padding:EdgeInsets.all(8),
                child:Center(child:Text(leaguelist[index].score.toString(), style: TextStyle(color:Colors.grey, fontSize: 24),))),

            ],
          )
        ),
        
        ],
      ));
    }
}




