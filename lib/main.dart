import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Leagues",
        home: Scaffold(
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
                    margin: const EdgeInsets.symmetric(horizontal: 110.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Leagues")],
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
                      height: 50,
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
                              'assets/cale.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // add some action latter
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 10, 112, 27),
                              )),
                              child: const Text(
                                'My Leagues',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                    const SizedBox(
                      height: 25,
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
                              'assets/cale.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // add some action latter
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 10, 112, 27),
                              )),
                              child: const Text(
                                'Join New League',
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        ));
  }
}
