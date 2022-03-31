import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../../domain/auth/repository/i_auth_facade.dart';
import '../../infra/auth/firebase_auth_facade.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final googleSignInProvider = Provider<GoogleSignIn>((ref) => GoogleSignIn());

final authFacadeProvider = Provider<IAuthFacade>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final googleSignIn = ref.watch(googleSignInProvider);

  return FirebaseAuthFacade(firebaseAuth, googleSignIn);
});

final loggerProvider = Provider<Logger>((ref) =>
    Logger(printer: PrettyPrinter(methodCount: 1, printEmojis: false)));
