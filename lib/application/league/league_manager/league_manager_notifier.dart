import 'package:FantasyE/domain/core/value_objects.dart';
import 'package:FantasyE/domain/leagues/i_league_repository.dart';
import 'package:FantasyE/domain/leagues/league.dart';
import 'package:FantasyE/domain/leagues/value_objects.dart';
import 'package:FantasyE/domain/leagues/league_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'league_manager_state.dart';
part 'league_manager_notifier.freezed.dart';

@injectable
class LeagueManagerNotifier extends StateNotifier<LeagueManagerState> {
  final ILeagueRepository _repository;

  LeagueManagerNotifier(this._repository) : super(LeagueManagerState.initial());

  void nameChanged(String nameStr) {
    state = state.copyWith(
      leagueName: LeagueName(nameStr),
      operationFailureOrSuccess: none(),
    );
  }

  Future<void> createLeaguePressed() async {
    final isLeagueNameValid = state.leagueName.isValid();
    if (isLeagueNameValid) {
      state = state.copyWith(operationFailureOrSuccess: none());
      final failureOrSuccess = await _repository.createLeague(
        League(
          id: UniqueId(),
          name: state.leagueName,
          members: [],
        ),
      );
      state = state.copyWith(
        operationFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }
  }

  void idSet(UniqueId id) {
    state = state.copyWith(uniqueId: id);
  }

  void leagueSelected({
    required LeagueName name,
    required UniqueId id,
    required List<MemberId> members,
  }) {
    state = state.copyWith(
      leagueName: name,
      uniqueId: id,
      members: members,
    );
  }

  Future<void> updateLeaguePressed() async {
    final isLeagueNameValid = state.leagueName.isValid();
    if (isLeagueNameValid) {
      state = state.copyWith(operationFailureOrSuccess: none());
      final failureOrSuccess = await _repository.updateLeague(
        League(
          id: state.uniqueId,
          name: state.leagueName,
          members: state.members,
        ),
      );
      state = state.copyWith(
        operationFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }
  }

  Future<void> deleteLeagueTriggered() async {
    final isLeagueNameValid = state.leagueName.isValid();
    if (isLeagueNameValid) {
      state = state.copyWith(operationFailureOrSuccess: none());
      final failureOrSuccess = await _repository.deleteLeague(
        League(
          id: state.uniqueId,
          name: state.leagueName,
          members: state.members,
        ),
      );
      state = state.copyWith(
        operationFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }
  }
}
