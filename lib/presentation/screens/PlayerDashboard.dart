import 'package:flutter/material.dart';

class PlayerDashboardScreen extends StatelessWidget {
  const PlayerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 158, 158),
        title: Container(
          color: const Color.fromARGB(255, 158, 158, 158),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Player DashBoard")],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'images/leg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // add some action latter
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 33, 33, 33),
                          )),
                          child: const Text(
                            'Create New Team',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 110,
                        height: 110,
                        child: Image.asset(
                          'images/leg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // add some action latter
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 33, 33, 33),
                          )),
                          child: const Text(
                            'Manage Teams',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'images/cale.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // add some action latter
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 33, 33, 33),
                          )),
                          child: const Text(
                            'Leagues',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
    );
  }
}
