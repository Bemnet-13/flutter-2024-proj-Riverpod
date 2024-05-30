import 'avatar_watcher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final avatarWatcherNotifierProvider =
    StateNotifierProvider<AvatarWatcherNotifier, AvatarWatcherState>((ref) {
  return getIt<AvatarWatcherNotifier>();
});
