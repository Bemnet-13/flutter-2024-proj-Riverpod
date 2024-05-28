import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../../domain/auth/value_objects.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:equatable/equatable.dart";

part 'auth_state.dart';
part 'auth_notifier.freezed.dart';

@injectable
class SignupFormNotifier extends StateNotifier<SignupFormState> {
  final IAuthFacade _authFacade;

  SignupFormNotifier(this._authFacade) : super(SignupFormState.initial());

  void emailChanged(String emailStr) {
    state = state.copyWith(
      emailAddress: EmailAddress(emailStr),
      authFailureOrSuccessOption: none(),
    );
  }

  void passwordChanged(String passwordStr) {
    state = state.copyWith(
      password: Password(passwordStr),
      authFailureOrSuccessOption: none(),
    );
  }

  void nameChanged(String nameStr) {
    state = state.copyWith(
      name: Name(nameStr),
      authFailureOrSuccessOption: none(),
    );
  }

  void chipSelected(String role) {
    state = state.copyWith(
      role: Role(role),
      authFailureOrSuccessOption: none(),
    );
  }

  void updateChip(int value) {
    state = state.copyWith(
      roleValue: value,
      authFailureOrSuccessOption: none(),
    );
  }

  Future<void> registerWithEmailAndPasswordPressed() async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      final failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
        name: state.name,
        role: state.role,
      );
      state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    } else {
      state = state.copyWith(
        showErrorMessages: true,
        authFailureOrSuccessOption: none(),
      );
    }
  }
}

@injectable
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  final IAuthFacade _authFacade;

  LoginFormNotifier(this._authFacade) : super(LoginFormState.initial());

  void emailChanged(String emailStr) {
    state = state.copyWith(
      emailAddress: EmailAddress(emailStr),
      authFailureOrSuccessOption: none(),
    );
  }

  void passwordChanged(String passwordStr) {
    state = state.copyWith(
      password: Password(passwordStr),
      authFailureOrSuccessOption: none(),
    );
  }

  void roleSelected(String roleStr) {
    state = state.copyWith(
      role: Role(roleStr),
      authFailureOrSuccessOption: none(),
    );
  }

  Future<void> loginWithEmailAndPasswordPressed() async {
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      state = state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      final failureOrSuccess = await _authFacade.loginWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
        role: state.role,
      );
      state = state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    } else {
      state = state.copyWith(
        showErrorMessages: true,
        authFailureOrSuccessOption: none(),
      );
    }
  }
}
