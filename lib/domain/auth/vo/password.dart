import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../core/value_objects.dart';
import '../../core/value_validators.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
