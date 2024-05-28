import 'league_watcher_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final leagueWatcherNotifierProvider =
    StateNotifierProvider<LeagueWatcherNotifier, LeagueWatcherState>((ref) {
  return getIt<LeagueWatcherNotifier>();
});
