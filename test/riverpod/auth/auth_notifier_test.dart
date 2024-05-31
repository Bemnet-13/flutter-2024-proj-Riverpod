import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:FantasyE/domain/auth/i_auth_facade.dart';
import 'package:FantasyE/domain/auth/value_objects.dart';
import 'package:FantasyE/application/auth/auth_form/auth_notifier.dart';

class MockAuthFacade extends Mock implements IAuthFacade {}

void main() {
  late SignupFormNotifier signupFormNotifier;
  late MockAuthFacade mockAuthFacade;

  setUp(() {
    mockAuthFacade = MockAuthFacade();
    signupFormNotifier = SignupFormNotifier(mockAuthFacade);
  });

  test('initial state should be SignupFormState.initial()', () {
    expect(signupFormNotifier.state, SignupFormState.initial());
  });

  test('emailChanged should update email address', () {
    const emailStr = 'test@example.com';
    signupFormNotifier.emailChanged(emailStr);

    expect(
      signupFormNotifier.state.emailAddress,
      EmailAddress(emailStr),
    );
    expect(
      signupFormNotifier.state.authFailureOrSuccessOption,
      none(),
    );
  });
}
