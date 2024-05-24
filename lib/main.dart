// main.dart

import 'package:flutter/material.dart';
import 'presentation/screens/add_avatar.dart';
import 'presentation/screens/admin_manage_avatars.dart';
import 'presentation/screens/AdminDashboard.dart';
import 'presentation/screens/create_avatar.dart';
import 'presentation/screens/create_team.dart';
import 'presentation/screens/faq.dart';
import 'presentation/screens/join_league.dart';
import 'presentation/screens/leaderboard_rank.dart';
import 'presentation/screens/Leagues.dart';
import 'presentation/screens/login.dart';
import 'presentation/screens/manage_team.dart';
import 'presentation/screens/my_leagues.dart';
import 'presentation/screens/PlayerDashboard.dart';
import 'presentation/screens/signup.dart';
import 'presentation/screens/choice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      initialRoute: '/login', // Set the initial route to the login screen
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/choice': (context) => const Choice(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/admin_dashboard': (context) => const AdminDashboardScreen(),
        '/player_dashboard': (context) => const PlayerDashboardScreen(),
        '/leagues': (context) => const LeaguesScreen(),
        '/join_league': (context) => JoinLeagueScreen(),
        '/create_team': (context) => CreateTeamScreen(),
        '/manage_team': (context) => ManageTeamScreen(),
        '/my_leagues': (context) => MyLeaguesScreen(),
        '/leaderboard_rank': (context) => LeaderboardRankScreen(),
        '/faq': (context) => FaqScreen(),
        '/create_avatar': (context) => CreateAvatarScreen(),
        '/add_avatar': (context) => AddAvatarScreen(),
        '/admin_manage_avatars': (context) => AdminManageAvatarsScreen(),
      },
    );
  }
}
