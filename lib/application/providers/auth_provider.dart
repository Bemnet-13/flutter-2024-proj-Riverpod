import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(loginEndpoint: "http://localhost:3000/auth/login");
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});

class AuthState {
  final bool isLoading;
  final String? token;
  final String? error;

  AuthState({this.isLoading = false, this.token, this.error});

  AuthState copyWith({bool? isLoading, String? token, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthNotifier(this.repository) : super(AuthState());

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true);

    final token = await repository.login(username, password);
    if (token != null) {
      state = state.copyWith(isLoading: false, token: token);
    } else {
      state = state.copyWith(isLoading: false, error: 'Login failed');
    }
  }
}
