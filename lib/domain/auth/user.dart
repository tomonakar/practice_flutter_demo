import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default("") String uid,
    @Default("") String email,
    @Default("") String displayName,
    @Default("") String photoUrl,
    @Default("") String phoneNumber,
    @Default("") String providerId,
  }) = _User;
}
