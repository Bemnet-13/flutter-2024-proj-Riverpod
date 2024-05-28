import 'manage_account_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final manageAccountNotifierProvider =
    StateNotifierProvider<ManageAccountNotifier, ManageAccountState>((ref) {
  return getIt<ManageAccountNotifier>();
});
