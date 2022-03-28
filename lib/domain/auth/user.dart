import 'package:flutter_samples/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required UniqueId uid,
    String? email,
    String? displayName,
    String? photoUrl,
    String? phoneNumber,
  }) = _User;
}
