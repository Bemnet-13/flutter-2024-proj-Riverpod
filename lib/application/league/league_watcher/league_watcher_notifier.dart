import 'package:FantasyE/domain/leagues/i_league_repository.dart';
import 'package:FantasyE/domain/leagues/league_failure.dart';
import 'package:FantasyE/domain/leagues/league.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'league_watcher_state.dart';
part 'league_watcher_notifier.freezed.dart';

@injectable
class LeagueWatcherNotifier extends StateNotifier<LeagueWatcherState> {
  final ILeagueRepository repository;

  LeagueWatcherNotifier(this.repository)
      : super(const LeagueWatcherState.initial());

  Future<void> getAllLeagues() async {
    final result = await repository.getAllLeagues();
    state = result.fold(
      (failure) => LeagueWatcherState.loadFailure(failure),
      (leagues) => LeagueWatcherState.loadSuccess(leagues),
    );
  }
}
