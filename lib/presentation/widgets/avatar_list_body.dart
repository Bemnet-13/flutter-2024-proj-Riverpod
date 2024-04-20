import 'package:flutter/material.dart';
import '../data/avatar_list_data.dart';
import 'entries/avatar_list_entry.dart';


class AvatarListBody extends StatelessWidget {
  // ignore: use_super_parameters
  const AvatarListBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final avatarListData = AvatarListData().avatarList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
          child: Center(
            child: Text(
              'Add avatars to your team and compete!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          
          
          child: ListView.builder(
            // physics: const ScrollPhysics(),
            // shrinkWrap: true,
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 1,
            //   crossAxisSpacing: 1,
            //   mainAxisSpacing: 1,
            // ),

            itemCount: avatarListData.length,
            itemBuilder: (context, index) {
              return AvatarListEntry(
                index: index,
                avatarList: avatarListData,
              );
            }, 
    ),
  ),
      ],
    );
  }
}
