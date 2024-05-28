import 'package:FantasyE/domain/auth/user.dart';
import 'package:FantasyE/domain/manage_account/i_manage_account_facade.dart';
import 'package:FantasyE/domain/manage_account/manage_account_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'auth_users_state.dart';
part 'auth_users_notifier.freezed.dart';

@injectable
class AuthUsersNotifier extends StateNotifier<AuthUsersState> {
  final IManageAccountFacade _iManageAccountFacade;

  AuthUsersNotifier(this._iManageAccountFacade)
      : super(const AuthUsersState.initial());

  Future<void> getAllUsers() async {
    final result = await _iManageAccountFacade.getAllUsers();
    state = result.fold(
      (failure) => AuthUsersState.loadFailure(failure),
      (users) => AuthUsersState.loadSuccess(users),
    );
  }
}
