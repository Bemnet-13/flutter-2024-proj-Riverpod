import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../domain/core/errors.dart';
import 'package:FantasyE/domain/core/failures.dart';
import 'package:FantasyE/domain/core/value_objects.dart';
import 'package:FantasyE/domain/core/value_validators.dart';

class EmailAddress extends Equatable implements ValueObject {
  final Either<ValueFailure<String>, String> value;

  @override
  List<Object> get props => [value];

  const EmailAddress._(this.value);

  String getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  // Factory constructor for creating an instance of EmailAddress
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
}

class Password extends Equatable implements ValueObject {
  @override
  final Either<ValueFailure<String>, String> value;

  @override
  List<Object> get props => [value];

  const Password._(this.value);
  bool isValid() => value.isRight();

  String getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), (r) => r);
  }

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  // Factory constructor for creating an instance of EmailAddress
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }
}

class Role extends Equatable implements ValueObject {
  @override
  List<Object> get props => [value];

  final Either<ValueFailure<String>, String> value;
  const Role._(this.value);

  bool isValid() => value.isRight();

  String getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  factory Role(String input) {
    return Role._(
      validateRole(input),
    );
  }
}

class Name extends Equatable implements ValueObject {
  final Either<ValueFailure<String>, String> value;
  const Name._(this.value);
  @override
  List<Object> get props => [value];

  bool isValid() => value.isRight();

  String getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  factory Name(String input) {
    return Name._(
      validateName(input),
    );
  }
}

class TeamName implements ValueObject {
  final Either<ValueFailure<String>, String> value;
  const TeamName._(this.value);

  bool isValid() => value.isRight();

  String getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  factory TeamName(String input) {
    return TeamName._(
      validateTeamName(input),
    );
  }
}
