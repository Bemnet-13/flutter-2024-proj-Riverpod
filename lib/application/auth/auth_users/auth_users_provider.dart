import 'auth_users_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final authUsersNotifierProvider =
    StateNotifierProvider<AuthUsersNotifier, AuthUsersState>((ref) {
  return getIt<AuthUsersNotifier>();
});
