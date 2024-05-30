import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:FantasyE/domain/avatar/avatar.dart';
import 'package:FantasyE/domain/avatar/avatar_failure.dart';
import 'package:FantasyE/domain/avatar/i_avatar_repository.dart';
import 'package:FantasyE/domain/avatar/value_objects.dart';
import 'package:FantasyE/domain/core/value_objects.dart';

part 'avatar_manager_notifier.freezed.dart';
part 'avatar_manager_state.dart';

@injectable
class AvatarManagerNotifier extends StateNotifier<AvatarManagerState> {
  final IAvatarRepository _repository;

  AvatarManagerNotifier(this._repository) : super(AvatarManagerState.initial());

  void nameChanged(String nameStr) {
    state = state.copyWith(
      avatarName: AvatarName(nameStr),
      operationFailureOrSuccess: none(),
    );
  }

  void clubChanged(String clubStr) {
    state = state.copyWith(
      avatarClub: AvatarClub(clubStr),
      operationFailureOrSuccess: none(),
    );
  }

  void scoreChanged(String scoreVal) {
    state = state.copyWith(
      avatarScore: AvatarScore(scoreVal),
      operationFailureOrSuccess: none(),
    );
  }

  Future<void> createAvatarPressed() async {
    final isAvatarNameValid = state.avatarName.isValid();
    if (isAvatarNameValid) {
      state = state.copyWith(operationFailureOrSuccess: none());
      final failureOrSuccess = await _repository.create(
        Avatar(
          id: state.uniqueId,
          avatarName: state.avatarName,
          avatarClub: state.avatarClub,
          avatarScore: state.avatarScore,
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

  void avatarSelected({
          required uniqueId,
          required avatarName,
          required avatarClub,
          required avatarScore,
  }) { state = state.copyWith(
           uniqueId: uniqueId,
           avatarName: avatarName,
           avatarClub: avatarClub,
           avatarScore: avatarScore,
  );
  }

  Future<void> updateAvatarPressed() async {
    final isAvatarNameValid = state.avatarName.isValid();
    if (isAvatarNameValid) {
      state = state.copyWith(operationFailureOrSuccess: none());
      final failureOrSuccess = await _repository.update(
        Avatar(
          id: state.uniqueId,
          avatarName: state.avatarName,
          avatarClub: state.avatarClub,
          avatarScore: state.avatarScore,
        ),
      );
      state = state.copyWith(
        operationFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }
  }

  Future<void> deleteAvatarTriggered() async {
    final isAvatarNameValid = state.avatarName.isValid();
    if (isAvatarNameValid) {
      state = state.copyWith(operationFailureOrSuccess: none());
      final failureOrSuccess = await _repository.delete(
        Avatar(
                    id: state.uniqueId,
          avatarName: state.avatarName,
          avatarClub: state.avatarClub,
          avatarScore: state.avatarScore,
        ),
      );
      state = state.copyWith(
        operationFailureOrSuccess: optionOf(failureOrSuccess),
      );
    }
  }
}
