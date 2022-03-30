import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/domain/auth/auth_failure.dart';
import 'package:flutter_samples/domain/auth/repository/i_auth_facade.dart';
import 'package:flutter_samples/presentation/providers/top_level_providers.dart';

import '../../domain/auth/usecase/i_auth_usecase.dart';
import '../../domain/auth/usecase/i_google_signi_n.dart';
import '../../domain/auth/user.dart';

class AuthUseCase implements IAuthUseCase {
  final IAuthFacade _authFacade;

  const AuthUseCase(this._authFacade);

  @override
  Future<Option<User>> getSignedInUser() => _authFacade.getSignedInUser();

  @override
  Future<Either<AuthFailure, Option<User>>> googleSignIn() async {
    try {
      await _authFacade.signInWithGoogle();
      final user = await _authFacade.getSignedInUser();
      return right(user);
    } on AuthFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<void> signOut() => _authFacade.signOut();
}
