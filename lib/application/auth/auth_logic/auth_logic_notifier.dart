import 'package:FantasyE/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_logic_state.dart';
part 'auth_logic_notifier.freezed.dart';

@injectable
class AuthLogicNotifier extends StateNotifier<AuthLogicState> {
  final IAuthFacade _authFacade;

  AuthLogicNotifier(this._authFacade) : super(const AuthLogicState.initial());

  Future<void> authCheckRequested() async {
    final userOption = await _authFacade.getSignedInUser();
    state = userOption.fold(
      () => const AuthLogicState.unauthenticated(),
      (user) {
        if (user.role.getOrCrash() == 'PLAYER') {
          return const AuthLogicState.authenticatedAsPlayer();
        } else {
          return const AuthLogicState.authenticatedAsAdmin();
        }
      },
    );
  }

  Future<void> logOut() async {
    await _authFacade.logOut();
    state = const AuthLogicState.unauthenticated();
  }

  Future<void> loginRequestedAsAdmin() async {
    final userOption = await _authFacade.getSignedInUser();
    state = userOption.fold(
      () => const AuthLogicState.unauthenticated(),
      (_) => const AuthLogicState.authenticatedAsAdmin(),
    );
  }

  Future<void> loginRequestedAsPlayer() async {
    final userOption = await _authFacade.getSignedInUser();
    state = userOption.fold(
      () => const AuthLogicState.unauthenticated(),
      (_) => const AuthLogicState.authenticatedAsPlayer(),
    );
  }
}
