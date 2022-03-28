import 'package:flutter_samples/domain/auth/repository/i_auth_facade.dart';
import 'package:flutter_samples/domain/auth/usecase/i_sign_out.dart';

class SignOut implements ISignOut {
  final IAuthFacade _authFacade;

  const SignOut(this._authFacade);

  @override
  Future<void> signOut() => _authFacade.signOut();
}
