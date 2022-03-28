import 'package:dartz/dartz.dart';
import 'package:flutter_samples/domain/auth/auth_failure.dart';
import 'package:flutter_samples/domain/auth/repository/i_auth_facade.dart';

import '../../domain/auth/usecase/i_google_signi_n.dart';

class GoogleSignIn implements IGoogleSignIn {
  final IAuthFacade _authFacade;

  const GoogleSignIn(this._authFacade);

  @override
  Future<Either<AuthFailure, Unit>> googleSignIn() =>
      _authFacade.signInWithGoogle();
}
