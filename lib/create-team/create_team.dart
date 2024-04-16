import 'package:faq/util/colors.dart';
import 'package:faq/util/my_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CreateTeam());
}

class CreateTeam extends StatelessWidget {
  const CreateTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: Builder(
                builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: CustomColors.lightPrimary,
                      ),
                    )),
            title: const Text(
              'Create Team',
              style: TextStyle(color: CustomColors.lightPrimary),
            ),
            centerTitle: true,
            backgroundColor: CustomColors.darkPrimary,
          ),
          drawer: const Drawer(
              // child: Icon(
              //   Icons.menu,
              //   color: CustomColors.lightPrimary,
              // ),
              ),
          body: const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 18),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                  ),
                  Text(
                    'CREATE YOUR TEAM TO ADD PLAYER AVATARS',
                    style: TextStyle(
                      color: CustomColors.texColor,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ), // will be edited with custom text widget
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text(
                        'Team Name',
                        style: TextStyle(
                          color: CustomColors.subText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [CustomButton(child: 'Create Team')],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
