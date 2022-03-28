import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_samples/domain/auth/user.dart';
import 'package:flutter_samples/domain/auth/vo/email_address.dart';
import 'package:flutter_samples/domain/auth/vo/password.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
