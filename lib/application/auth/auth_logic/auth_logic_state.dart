part of 'auth_logic_notifier.dart';

@freezed
class AuthLogicState with _$AuthLogicState {
  const factory AuthLogicState.initial() = Initial;
  const factory AuthLogicState.authenticatedAsAdmin() = AuthenticatedAsAdmin;
  const factory AuthLogicState.authenticatedAsPlayer() = AuthenticatedAsPlayer;
  const factory AuthLogicState.unauthenticated() = Unauthenticated;
}
