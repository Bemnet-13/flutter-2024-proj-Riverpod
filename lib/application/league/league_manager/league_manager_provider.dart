import 'league_manager_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';

final leagueManagerNotifierProvider =
    StateNotifierProvider<LeagueManagerNotifier, LeagueManagerState>((ref) {
  return getIt<LeagueManagerNotifier>();
});
