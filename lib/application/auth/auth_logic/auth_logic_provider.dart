import 'auth_logic_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final authLogicNotifierProvider =
    StateNotifierProvider<AuthLogicNotifier, AuthLogicState>((ref) {
  return getIt<AuthLogicNotifier>();
});
