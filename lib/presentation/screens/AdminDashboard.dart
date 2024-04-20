import 'package:flutter/material.dart';
import '../widgets/colors.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Admin DashBoard',
          style: TextStyle(color: CustomColors.lightPrimary),
        ),
        centerTitle: true,
        backgroundColor: CustomColors.darkPrimary,
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
                          'assets/avat.png',
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
                            'Create New Avatar',
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
                          'assets/herevat.png',
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
                            'Manage Avatars',
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
                          'assets/cale.png',
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
                            'Manage Leagues',
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
