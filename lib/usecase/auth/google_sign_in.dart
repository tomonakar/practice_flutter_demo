import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/domain/auth/auth_failure.dart';
import 'package:flutter_samples/domain/auth/repository/i_auth_facade.dart';

import '../../domain/auth/usecase/i_google_signi_n.dart';
import '../../domain/auth/user.dart';

// 本来は、UseCaseでは状態を持たずに、ViewModelで状態を持つようにしたいが、
// 現状、余計なレイヤーが１つ増えるだけなので、一旦UseCaseで状態をもつようにしている
class GoogleSignInUseCase with ChangeNotifier implements IGoogleSignIn {
  GoogleSignInUseCase(this._authFacade) : super();
  final IAuthFacade _authFacade;
  bool isLoading = false;
  dynamic error;

  @override
  Future<Option<User>> googleSignIn() async {
    try {
      isLoading = true;
      notifyListeners();
      await _authFacade.signInWithGoogle();
      final user = await _authFacade.getSignedInUser();
      return user;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
