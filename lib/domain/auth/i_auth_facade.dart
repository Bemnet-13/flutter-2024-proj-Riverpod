import 'package:dartz/dartz.dart';
import 'auth_failure.dart';
import '/domain/auth/value_objects.dart';
import 'user.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress,
      required Password password,
      required Name name,
      required Role role});
  Future<Either<AuthFailure, Unit>> loginWithEmailAndPassword(
      {required EmailAddress emailAddress,
      required Password password,
      required Role role});
  Future<Option<User>> getSignedInUser();
  Future<void> logOut();
}
