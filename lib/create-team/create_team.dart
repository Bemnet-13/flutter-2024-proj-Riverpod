import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          title: const Text('Create Team'),
          centerTitle: true,
        ),
        drawer: const Drawer(
            // child: Icon(Icons.menu),
            ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              const Text(
                'CREATE YOUR TEAM TO ADD PLAYER AVATARS.',
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Team name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create Team'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
