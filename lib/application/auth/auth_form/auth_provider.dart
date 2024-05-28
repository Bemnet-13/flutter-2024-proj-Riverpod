import 'auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:FantasyE/injection.dart';


final signupFormNotifierProvider =
    StateNotifierProvider<SignupFormNotifier, SignupFormState>((ref) {
  return getIt<SignupFormNotifier>();
});

final loginFormNotifierProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormState>((ref) {
  return getIt<LoginFormNotifier>();
});
