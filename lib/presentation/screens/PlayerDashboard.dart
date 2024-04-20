import 'package:flutter/material.dart';
import '../widgets/colors.dart';

class PlayerDashboardScreen extends StatelessWidget {
  const PlayerDashboardScreen({super.key});

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
          'Player DashBoard',
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
                          'assets/leg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/create_team');
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
                          'assets/leg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/manage_team');
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
                          'assets/cale.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/my_leagues');
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
