import 'avatar_manager_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final avatarManagerNotifierProvider =
    StateNotifierProvider<AvatarManagerNotifier, AvatarManagerState>((ref) {
  return getIt<AvatarManagerNotifier>();
});
