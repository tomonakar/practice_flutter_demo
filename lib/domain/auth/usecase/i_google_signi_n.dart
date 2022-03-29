import 'package:dartz/dartz.dart';
import 'package:flutter_samples/domain/auth/auth_failure.dart';

import '../user.dart';

abstract class IGoogleSignIn {
  Future<Either<AuthFailure, Option<User>>> googleSignIn();
}
