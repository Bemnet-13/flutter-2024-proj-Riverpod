import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:FantasyE/domain/auth/user.dart';
import 'package:FantasyE/domain/manage_account/i_manage_account_facade.dart';
import 'package:FantasyE/domain/manage_account/manage_account_failure.dart';
import 'package:FantasyE/application/auth/auth_users/auth_users_notifier.dart';

class MockManageAccountFacade extends Mock implements IManageAccountFacade {}

class FakeUserDetails extends Fake implements UserDetails {}

void main() {
  late AuthUsersNotifier authUsersNotifier;
  late MockManageAccountFacade mockManageAccountFacade;

  setUp(() {
    mockManageAccountFacade = MockManageAccountFacade();
    authUsersNotifier = AuthUsersNotifier(mockManageAccountFacade);
  });

  test('initial state should be AuthUsersState.initial()', () {
    expect(authUsersNotifier.state, const AuthUsersState.initial());
  });

  test(
      'getAllUsers should update state to loadSuccess when users are fetched successfully',
      () async {
    final fakeUsers = [FakeUserDetails()];
    when(() => mockManageAccountFacade.getAllUsers())
        .thenAnswer((_) async => right(fakeUsers));

    await authUsersNotifier.getAllUsers();

    expect(authUsersNotifier.state, AuthUsersState.loadSuccess(fakeUsers));
  });

  test(
      'getAllUsers should update state to loadFailure when fetching users fails',
      () async {
    final failure = ManageAccountFailure.serverError();
    when(() => mockManageAccountFacade.getAllUsers())
        .thenAnswer((_) async => left(failure));

    await authUsersNotifier.getAllUsers();

    expect(authUsersNotifier.state, AuthUsersState.loadFailure(failure));
  });
}
