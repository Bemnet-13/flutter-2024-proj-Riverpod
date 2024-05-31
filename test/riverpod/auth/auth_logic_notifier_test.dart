import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:FantasyE/domain/auth/i_auth_facade.dart';
import 'package:FantasyE/domain/auth/user.dart';
import 'package:FantasyE/application/auth/auth_logic/auth_logic_notifier.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

class FakeUser extends Fake implements User {}

void main() {
  late AuthLogicNotifier authLogicNotifier;
  late MockAuthFacade mockAuthFacade;

  setUp(() {
    mockAuthFacade = MockAuthFacade();
    authLogicNotifier = AuthLogicNotifier(mockAuthFacade);
  });

  test('initial state should be AuthLogicState.initial()', () {
    expect(authLogicNotifier.state, const AuthLogicState.initial());
  });

  test(
      'authCheckRequested should update state to unauthenticated if no user is signed in',
      () async {
    when(() => mockAuthFacade.getSignedInUser())
        .thenAnswer((_) async => none());

    await authLogicNotifier.authCheckRequested();

    expect(authLogicNotifier.state, const AuthLogicState.unauthenticated());
  });

  test('logOut should update state to unauthenticated', () async {
    when(() => mockAuthFacade.logOut()).thenAnswer((_) async {});

    await authLogicNotifier.logOut();

    expect(authLogicNotifier.state, const AuthLogicState.unauthenticated());
  });

  test(
      'loginRequestedAsAdmin should update state to authenticatedAsAdmin if user is signed in',
      () async {
    final fakeUser = FakeUser();
    when(() => mockAuthFacade.getSignedInUser())
        .thenAnswer((_) async => some(fakeUser));

    await authLogicNotifier.loginRequestedAsAdmin();

    expect(
        authLogicNotifier.state, const AuthLogicState.authenticatedAsAdmin());
  });

  test(
      'loginRequestedAsAdmin should update state to unauthenticated if no user is signed in',
      () async {
    when(() => mockAuthFacade.getSignedInUser())
        .thenAnswer((_) async => none());

    await authLogicNotifier.loginRequestedAsAdmin();

    expect(authLogicNotifier.state, const AuthLogicState.unauthenticated());
  });

  test(
      'loginRequestedAsPlayer should update state to authenticatedAsPlayer if user is signed in',
      () async {
    final fakeUser = FakeUser();
    when(() => mockAuthFacade.getSignedInUser())
        .thenAnswer((_) async => some(fakeUser));

    await authLogicNotifier.loginRequestedAsPlayer();

    expect(
        authLogicNotifier.state, const AuthLogicState.authenticatedAsPlayer());
  });

  test(
      'loginRequestedAsPlayer should update state to unauthenticated if no user is signed in',
      () async {
    when(() => mockAuthFacade.getSignedInUser())
        .thenAnswer((_) async => none());

    await authLogicNotifier.loginRequestedAsPlayer();

    expect(authLogicNotifier.state, const AuthLogicState.unauthenticated());
  });
}
