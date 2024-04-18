// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LeagueListEntry extends StatelessWidget{
  final List leaguelist;
  final int index;

  const LeagueListEntry({
    super.key, 
    required this.leaguelist, 
    required this.index
    });

  @override 
  Widget build(context){
    final currLeague = leaguelist[index];
    return   Padding(
            padding:EdgeInsets.only(bottom:36),
      child:Column(
      children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width:100,
            height:100,
            
            child:Padding(
              padding:EdgeInsets.all(16),
              child:Icon(Icons.sports_soccer, color: Colors.grey,size: 100,)
              ),
              ),
            SizedBox(width:20),
          Column(children: [
            Text(currLeague.leaguename, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Players Number: ${currLeague.playersnumber}"),
            Padding(
                  padding:EdgeInsets.only(top:8),
                  child:ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal ,foregroundColor: Colors.white,
                  
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                  
                ),),
            onPressed: () {},
            child: Text('Join League'),
          ),),
          ],),
          
        ],),
    Padding(
      padding:EdgeInsets.only(top:36, left:36, right:36),
      child:Divider(
      color: Colors.grey.withOpacity(0.5),
      thickness: 1,
      height: 20, 
    ),
),],),
);
  }
}