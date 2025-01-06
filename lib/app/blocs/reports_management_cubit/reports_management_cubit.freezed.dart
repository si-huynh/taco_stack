// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_management_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportsManagementState _$ReportsManagementStateFromJson(
    Map<String, dynamic> json) {
  return _ReportsManagementState.fromJson(json);
}

/// @nodoc
mixin _$ReportsManagementState {
  ReportsManagementStateStatus get status => throw _privateConstructorUsedError;
  List<DailyStandup> get dailyStandups => throw _privateConstructorUsedError;
  WeeklyReport get weeklyReport => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this ReportsManagementState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportsManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportsManagementStateCopyWith<ReportsManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportsManagementStateCopyWith<$Res> {
  factory $ReportsManagementStateCopyWith(ReportsManagementState value,
          $Res Function(ReportsManagementState) then) =
      _$ReportsManagementStateCopyWithImpl<$Res, ReportsManagementState>;
  @useResult
  $Res call(
      {ReportsManagementStateStatus status,
      List<DailyStandup> dailyStandups,
      WeeklyReport weeklyReport,
      String? errorMessage});
}

/// @nodoc
class _$ReportsManagementStateCopyWithImpl<$Res,
        $Val extends ReportsManagementState>
    implements $ReportsManagementStateCopyWith<$Res> {
  _$ReportsManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportsManagementState
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
              as ReportsManagementStateStatus,
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
abstract class _$$ReportsManagementStateImplCopyWith<$Res>
    implements $ReportsManagementStateCopyWith<$Res> {
  factory _$$ReportsManagementStateImplCopyWith(
          _$ReportsManagementStateImpl value,
          $Res Function(_$ReportsManagementStateImpl) then) =
      __$$ReportsManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReportsManagementStateStatus status,
      List<DailyStandup> dailyStandups,
      WeeklyReport weeklyReport,
      String? errorMessage});
}

/// @nodoc
class __$$ReportsManagementStateImplCopyWithImpl<$Res>
    extends _$ReportsManagementStateCopyWithImpl<$Res,
        _$ReportsManagementStateImpl>
    implements _$$ReportsManagementStateImplCopyWith<$Res> {
  __$$ReportsManagementStateImplCopyWithImpl(
      _$ReportsManagementStateImpl _value,
      $Res Function(_$ReportsManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReportsManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dailyStandups = null,
    Object? weeklyReport = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ReportsManagementStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportsManagementStateStatus,
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
class _$ReportsManagementStateImpl
    with DiagnosticableTreeMixin
    implements _ReportsManagementState {
  const _$ReportsManagementStateImpl(
      {this.status = ReportsManagementStateStatus.initial,
      final List<DailyStandup> dailyStandups = const [],
      required this.weeklyReport,
      this.errorMessage = null})
      : _dailyStandups = dailyStandups;

  factory _$ReportsManagementStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportsManagementStateImplFromJson(json);

  @override
  @JsonKey()
  final ReportsManagementStateStatus status;
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
    return 'ReportsManagementState(status: $status, dailyStandups: $dailyStandups, weeklyReport: $weeklyReport, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportsManagementState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('dailyStandups', dailyStandups))
      ..add(DiagnosticsProperty('weeklyReport', weeklyReport))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportsManagementStateImpl &&
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

  /// Create a copy of ReportsManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportsManagementStateImplCopyWith<_$ReportsManagementStateImpl>
      get copyWith => __$$ReportsManagementStateImplCopyWithImpl<
          _$ReportsManagementStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportsManagementStateImplToJson(
      this,
    );
  }
}

abstract class _ReportsManagementState implements ReportsManagementState {
  const factory _ReportsManagementState(
      {final ReportsManagementStateStatus status,
      final List<DailyStandup> dailyStandups,
      required final WeeklyReport weeklyReport,
      final String? errorMessage}) = _$ReportsManagementStateImpl;

  factory _ReportsManagementState.fromJson(Map<String, dynamic> json) =
      _$ReportsManagementStateImpl.fromJson;

  @override
  ReportsManagementStateStatus get status;
  @override
  List<DailyStandup> get dailyStandups;
  @override
  WeeklyReport get weeklyReport;
  @override
  String? get errorMessage;

  /// Create a copy of ReportsManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportsManagementStateImplCopyWith<_$ReportsManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
