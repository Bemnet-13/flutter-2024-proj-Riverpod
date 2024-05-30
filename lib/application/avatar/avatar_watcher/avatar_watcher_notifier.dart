import 'package:FantasyE/domain/avatar/i_avatar_repository.dart';
import 'package:FantasyE/domain/avatar/avatar_failure.dart';
import 'package:FantasyE/domain/avatar/avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'avatar_watcher_state.dart';
part 'avatar_watcher_notifier.freezed.dart';

@injectable
class AvatarWatcherNotifier extends StateNotifier<AvatarWatcherState> {
  final IAvatarRepository repository;

  AvatarWatcherNotifier(this.repository)
      : super(const AvatarWatcherState.initial());

  Future<void> getAllAvatars() async {
    final result = await repository.watchAll();
    state = result.fold(
      (failure) => AvatarWatcherState.loadFailure(failure),
      (avatars) => AvatarWatcherState.loadSuccess(avatars),
    );
  }
}
