import 'package:FantasyE/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;
  UnexpectedValueError(this.valueFailure);
  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating';
    return Error.safeToString('$explanation T Failure was : $valueFailure');
  }
}
