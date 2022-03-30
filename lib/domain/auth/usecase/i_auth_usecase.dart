import 'package:dartz/dartz.dart';
import 'package:flutter_samples/domain/auth/auth_failure.dart';

import '../user.dart';

abstract class IAuthUseCase {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Option<User>>> googleSignIn();
  Future<void> signOut();
}
