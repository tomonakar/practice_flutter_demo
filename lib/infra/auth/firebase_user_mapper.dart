import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/auth/user.dart';
import '../../domain/core/value_objects.dart';

// TODO: リネーム
extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      uid: UniqueId.fromUniqueString(uid),
      email: email,
      displayName: displayName,
      photoUrl: photoURL,
      phoneNumber: phoneNumber,
    );
  }
}
