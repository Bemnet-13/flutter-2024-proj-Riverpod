import 'package:FantasyE/application/auth/auth_logic/auth_logic_notifier.dart';
import 'package:FantasyE/application/auth/auth_logic/auth_logic_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthSplash extends ConsumerWidget {
  const AuthSplash();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authLogicManager = ref.read(authLogicNotifierProvider.notifier);
    authLogicManager.authCheckRequested();
    ref.listen(authLogicNotifierProvider, (previous, next) {
      next.maybeMap(
        initial: (_) {
          context.go('/welocome');
        },
        authenticatedAsAdmin: (_) {
          context.go('/admin_dashboard');
        },
        authenticatedAsPlayer: (_) {
          context.go('/player_dashboard');
        },
        unauthenticated: (_) {
          context.go('/welcome');
        },
        orElse: () => context.go('/welcome'),
      );
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(
              'Please Wait...',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
