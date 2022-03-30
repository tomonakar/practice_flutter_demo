import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_samples/domain/auth/user.dart';
import 'package:flutter_samples/infra/auth/firebase_auth_facade.dart';
import 'package:flutter_samples/usecase/auth/auth_usecase.dart';
import 'package:flutter_samples/usecase/auth/google_sign_in.dart';

import '../../../domain/auth/repository/i_auth_facade.dart';

final userProvider = StateProvider<Option<User>>((ref) {
  final user = FirebaseAuthFacade(ref._authFacade);

  final user = _authFacade.getSignedInUser()
});
