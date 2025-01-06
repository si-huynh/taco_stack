// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_standup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DailyStandupState _$DailyStandupStateFromJson(Map<String, dynamic> json) {
  return _DailyStandupState.fromJson(json);
}

/// @nodoc
mixin _$DailyStandupState {
  DailyStandupStateStatus get status => throw _privateConstructorUsedError;
  List<DailyStandup> get dailyStandups => throw _privateConstructorUsedError;
  WeeklyReport get weeklyReport => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this DailyStandupState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyStandupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyStandupStateCopyWith<DailyStandupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStandupStateCopyWith<$Res> {
  factory $DailyStandupStateCopyWith(
          DailyStandupState value, $Res Function(DailyStandupState) then) =
      _$DailyStandupStateCopyWithImpl<$Res, DailyStandupState>;
  @useResult
  $Res call(
      {DailyStandupStateStatus status,
      List<DailyStandup> dailyStandups,
      WeeklyReport weeklyReport,
      String? errorMessage});
}

/// @nodoc
class _$DailyStandupStateCopyWithImpl<$Res, $Val extends DailyStandupState>
    implements $DailyStandupStateCopyWith<$Res> {
  _$DailyStandupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyStandupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dailyStandups = null,
    Object? weeklyReport = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DailyStandupStateStatus,
      dailyStandups: null == dailyStandups
          ? _value.dailyStandups
          : dailyStandups // ignore: cast_nullable_to_non_nullable
              as List<DailyStandup>,
      weeklyReport: null == weeklyReport
          ? _value.weeklyReport
          : weeklyReport // ignore: cast_nullable_to_non_nullable
              as WeeklyReport,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyStandupStateImplCopyWith<$Res>
    implements $DailyStandupStateCopyWith<$Res> {
  factory _$$DailyStandupStateImplCopyWith(_$DailyStandupStateImpl value,
          $Res Function(_$DailyStandupStateImpl) then) =
      __$$DailyStandupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DailyStandupStateStatus status,
      List<DailyStandup> dailyStandups,
      WeeklyReport weeklyReport,
      String? errorMessage});
}

/// @nodoc
class __$$DailyStandupStateImplCopyWithImpl<$Res>
    extends _$DailyStandupStateCopyWithImpl<$Res, _$DailyStandupStateImpl>
    implements _$$DailyStandupStateImplCopyWith<$Res> {
  __$$DailyStandupStateImplCopyWithImpl(_$DailyStandupStateImpl _value,
      $Res Function(_$DailyStandupStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyStandupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dailyStandups = null,
    Object? weeklyReport = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DailyStandupStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DailyStandupStateStatus,
      dailyStandups: null == dailyStandups
          ? _value._dailyStandups
          : dailyStandups // ignore: cast_nullable_to_non_nullable
              as List<DailyStandup>,
      weeklyReport: null == weeklyReport
          ? _value.weeklyReport
          : weeklyReport // ignore: cast_nullable_to_non_nullable
              as WeeklyReport,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyStandupStateImpl
    with DiagnosticableTreeMixin
    implements _DailyStandupState {
  const _$DailyStandupStateImpl(
      {this.status = DailyStandupStateStatus.initial,
      final List<DailyStandup> dailyStandups = const [],
      required this.weeklyReport,
      this.errorMessage = null})
      : _dailyStandups = dailyStandups;

  factory _$DailyStandupStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStandupStateImplFromJson(json);

  @override
  @JsonKey()
  final DailyStandupStateStatus status;
  final List<DailyStandup> _dailyStandups;
  @override
  @JsonKey()
  List<DailyStandup> get dailyStandups {
    if (_dailyStandups is EqualUnmodifiableListView) return _dailyStandups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyStandups);
  }

  @override
  final WeeklyReport weeklyReport;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DailyStandupState(status: $status, dailyStandups: $dailyStandups, weeklyReport: $weeklyReport, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DailyStandupState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('dailyStandups', dailyStandups))
      ..add(DiagnosticsProperty('weeklyReport', weeklyReport))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStandupStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._dailyStandups, _dailyStandups) &&
            (identical(other.weeklyReport, weeklyReport) ||
                other.weeklyReport == weeklyReport) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_dailyStandups),
      weeklyReport,
      errorMessage);

  /// Create a copy of DailyStandupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStandupStateImplCopyWith<_$DailyStandupStateImpl> get copyWith =>
      __$$DailyStandupStateImplCopyWithImpl<_$DailyStandupStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStandupStateImplToJson(
      this,
    );
  }
}

abstract class _DailyStandupState implements DailyStandupState {
  const factory _DailyStandupState(
      {final DailyStandupStateStatus status,
      final List<DailyStandup> dailyStandups,
      required final WeeklyReport weeklyReport,
      final String? errorMessage}) = _$DailyStandupStateImpl;

  factory _DailyStandupState.fromJson(Map<String, dynamic> json) =
      _$DailyStandupStateImpl.fromJson;

  @override
  DailyStandupStateStatus get status;
  @override
  List<DailyStandup> get dailyStandups;
  @override
  WeeklyReport get weeklyReport;
  @override
  String? get errorMessage;

  /// Create a copy of DailyStandupState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStandupStateImplCopyWith<_$DailyStandupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
