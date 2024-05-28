import 'package:FantasyE/domain/core/value_objects.dart';
import 'package:FantasyE/domain/manage_account/manage_account_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:FantasyE/domain/auth/value_objects.dart';
import 'package:FantasyE/domain/manage_account/i_manage_account_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'manage_account_state.dart';
part 'manage_account_notifier.freezed.dart';

@injectable
class ManageAccountNotifier extends StateNotifier<ManageAccountState> {
  final IManageAccountFacade _manageAccountFacade;

  ManageAccountNotifier(this._manageAccountFacade)
      : super(ManageAccountState.initial());

  void emailChanged(String emailStr) {
    state = state.copyWith(
      emailAddress: EmailAddress(emailStr),
      operationFailureOrSuccessOption: none(),
    );
  }

  void passwordChanged(String passwordStr) {
    state = state.copyWith(
      password: Password(passwordStr),
      operationFailureOrSuccessOption: none(),
    );
  }

  void nameChanged(String nameStr) {
    state = state.copyWith(
      name: Name(nameStr),
      operationFailureOrSuccessOption: none(),
    );
  }

  void teamNameChanged(String teamNameStr) {
    state = state.copyWith(
      teamName: TeamName(teamNameStr),
      operationFailureOrSuccessOption: none(),
    );
  }

  void suspensionStateSet(bool suspensionState) {
    state = state.copyWith(
      suspensionState: suspensionState,
      operationFailureOrSuccessOption: none(),
    );
  }

  void userAccountSelected({
    required UniqueId id,
    required EmailAddress emailAddress,
    required Name name,
    required Role role,
    required bool suspensionState,
  }) {
    state = state.copyWith(
      id: id,
      emailAddress: emailAddress,
      role: role,
      name: name,
      suspensionState: suspensionState,
      operationFailureOrSuccessOption: none(),
    );
  }

  Future<void> updateUserAccountPressed() async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(
        isSubmitting: true,
        operationFailureOrSuccessOption: none(),
      );
      final failureOrSuccess = await _manageAccountFacade.updateUserAccount(
        emailAddress: state.emailAddress,
        password: state.password,
        name: state.name,
        teamName: state.teamName,
      );
      state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        operationFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    } else {
      state = state.copyWith(
        showErrorMessages: true,
      );
    }
  }

  Future<void> suspendUserAccountPressed(UniqueId userId) async {
    state = state.copyWith(
      isSubmitting: true,
      operationFailureOrSuccessOption: none(),
    );
    final failureOrSuccess = await _manageAccountFacade.suspendUserAccount(
      userId: userId.getOrCrash(),
      suspensionState: state.suspensionState,
    );
    state = state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      operationFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

  Future<void> deleteUserAccountPressed(UniqueId userId) async {
    state = state.copyWith(
      isSubmitting: true,
      operationFailureOrSuccessOption: none(),
    );
    final failureOrSuccess =
        await _manageAccountFacade.deleteUserAccount(userId: userId.getOrCrash());
    state = state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      operationFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
