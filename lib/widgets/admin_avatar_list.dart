import 'package:flutter/material.dart';
import '../data/avatar_list_data.dart';
import 'entries/admin_avatar_list_entry.dart';


class AdminAvatarListBody extends StatelessWidget {
  // ignore: use_super_parameters
  const AdminAvatarListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
          child: Center(
            child: Text(
              'Avatars Management',
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

            itemCount: AvatarListData().avatarList.length,
            itemBuilder: (context, index) {
              final avatarListData = AvatarListData();
              return AvatarListEntry(
                index: index,
                avatarList: avatarListData.avatarList,
                length: avatarListData.avatarList.length,
              );
            }, 
    ),
  ),
      ],
    );
  }
}
