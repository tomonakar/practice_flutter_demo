// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoIdTearOff {
  const _$TodoIdTearOff();

  _TodoId call([String? value]) {
    return _TodoId(
      value,
    );
  }
}

/// @nodoc
const $TodoId = _$TodoIdTearOff();

/// @nodoc
mixin _$TodoId {
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoIdCopyWith<TodoId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoIdCopyWith<$Res> {
  factory $TodoIdCopyWith(TodoId value, $Res Function(TodoId) then) =
      _$TodoIdCopyWithImpl<$Res>;
  $Res call({String? value});
}

/// @nodoc
class _$TodoIdCopyWithImpl<$Res> implements $TodoIdCopyWith<$Res> {
  _$TodoIdCopyWithImpl(this._value, this._then);

  final TodoId _value;
  // ignore: unused_field
  final $Res Function(TodoId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TodoIdCopyWith<$Res> implements $TodoIdCopyWith<$Res> {
  factory _$TodoIdCopyWith(_TodoId value, $Res Function(_TodoId) then) =
      __$TodoIdCopyWithImpl<$Res>;
  @override
  $Res call({String? value});
}

/// @nodoc
class __$TodoIdCopyWithImpl<$Res> extends _$TodoIdCopyWithImpl<$Res>
    implements _$TodoIdCopyWith<$Res> {
  __$TodoIdCopyWithImpl(_TodoId _value, $Res Function(_TodoId) _then)
      : super(_value, (v) => _then(v as _TodoId));

  @override
  _TodoId get _value => super._value as _TodoId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_TodoId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TodoId implements _TodoId {
  const _$_TodoId([this.value]);

  @override
  final String? value;

  @override
  String toString() {
    return 'TodoId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$TodoIdCopyWith<_TodoId> get copyWith =>
      __$TodoIdCopyWithImpl<_TodoId>(this, _$identity);
}

abstract class _TodoId implements TodoId {
  const factory _TodoId([String? value]) = _$_TodoId;

  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$TodoIdCopyWith<_TodoId> get copyWith => throw _privateConstructorUsedError;
}
