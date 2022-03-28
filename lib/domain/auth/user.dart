import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String uid,
    required String email,
    required String displayName,
    required String photoUrl,
    required String phoneNumber,
    required String providerId,
  }) = _User;
}
