// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoState _$UserInfoStateFromJson(Map<String, dynamic> json) {
  return _UserInfoState.fromJson(json);
}

/// @nodoc
mixin _$UserInfoState {
  UserInfo? get userInfo => throw _privateConstructorUsedError;

  /// Serializes this UserInfoState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoStateCopyWith<UserInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoStateCopyWith<$Res> {
  factory $UserInfoStateCopyWith(
          UserInfoState value, $Res Function(UserInfoState) then) =
      _$UserInfoStateCopyWithImpl<$Res, UserInfoState>;
  @useResult
  $Res call({UserInfo? userInfo});
}

/// @nodoc
class _$UserInfoStateCopyWithImpl<$Res, $Val extends UserInfoState>
    implements $UserInfoStateCopyWith<$Res> {
  _$UserInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoStateImplCopyWith<$Res>
    implements $UserInfoStateCopyWith<$Res> {
  factory _$$UserInfoStateImplCopyWith(
          _$UserInfoStateImpl value, $Res Function(_$UserInfoStateImpl) then) =
      __$$UserInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserInfo? userInfo});
}

/// @nodoc
class __$$UserInfoStateImplCopyWithImpl<$Res>
    extends _$UserInfoStateCopyWithImpl<$Res, _$UserInfoStateImpl>
    implements _$$UserInfoStateImplCopyWith<$Res> {
  __$$UserInfoStateImplCopyWithImpl(
      _$UserInfoStateImpl _value, $Res Function(_$UserInfoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInfo = freezed,
  }) {
    return _then(_$UserInfoStateImpl(
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoStateImpl
    with DiagnosticableTreeMixin
    implements _UserInfoState {
  const _$UserInfoStateImpl({this.userInfo = null});

  factory _$UserInfoStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoStateImplFromJson(json);

  @override
  @JsonKey()
  final UserInfo? userInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfoState(userInfo: $userInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfoState'))
      ..add(DiagnosticsProperty('userInfo', userInfo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoStateImpl &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userInfo);

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoStateImplCopyWith<_$UserInfoStateImpl> get copyWith =>
      __$$UserInfoStateImplCopyWithImpl<_$UserInfoStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoStateImplToJson(
      this,
    );
  }
}

abstract class _UserInfoState implements UserInfoState {
  const factory _UserInfoState({final UserInfo? userInfo}) =
      _$UserInfoStateImpl;

  factory _UserInfoState.fromJson(Map<String, dynamic> json) =
      _$UserInfoStateImpl.fromJson;

  @override
  UserInfo? get userInfo;

  /// Create a copy of UserInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoStateImplCopyWith<_$UserInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
