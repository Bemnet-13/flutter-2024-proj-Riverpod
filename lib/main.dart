import 'package:FantasyE/application/auth/auth_logic/auth_logic_provider.dart';
import 'package:FantasyE/presentation/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes.dart';
import 'injection.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    // Trigger the auth check as soon as the provider is available
    Future.microtask(() {
      ref.read(authLogicNotifierProvider.notifier).authCheckRequested();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Fantasy Ethiopia',
        routerConfig: routeSetup.router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            backgroundColor: CustomColors.primary,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

Routes routeSetup = Routes();
