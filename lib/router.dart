import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'presentation/screens/add_avatar.dart';
import 'presentation/screens/AdminDashboard.dart';
import 'presentation/screens/login.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/admin_dashboard',
      builder: (context, state) => AdminDashboardScreen(),
    ),
    GoRoute(
      path: '/add_avatar',
      builder: (context, state) => AddAvatarScreen(),
    ),
    // Add more routes here
  ],
);
