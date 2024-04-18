// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';

class AvatarListEntry extends StatelessWidget {
  final int index;
  final List avatarList;
  final int length;

  const AvatarListEntry({
    Key? key,
    required this.index,
    required this.avatarList,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentAvatar = avatarList[index];
    return  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child:ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                currentAvatar.avatarPic,
                fit: BoxFit.cover,
              ),)
            ),
          ),
          SizedBox(width: 16), // Add spacing between image and text
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentAvatar.avatarName,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(currentAvatar.avatarClub),
                Padding(
                  padding:EdgeInsets.only(top:6),
                  child:ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal ,foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                  
                ),),
            onPressed: () {},
            child: const Text('Edit'),
          ),)
              ],
            ),
          
          
        ],
      
    );
  }
}
