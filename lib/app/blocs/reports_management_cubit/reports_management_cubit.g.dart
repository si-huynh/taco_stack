// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_management_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportsManagementStateImpl _$$ReportsManagementStateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportsManagementStateImpl(
      status: $enumDecodeNullable(
              _$ReportsManagementStateStatusEnumMap, json['status']) ??
          ReportsManagementStateStatus.initial,
      dailyStandups: (json['dailyStandups'] as List<dynamic>?)
              ?.map((e) => DailyStandup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklyReport:
          WeeklyReport.fromJson(json['weeklyReport'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String? ?? null,
    );

Map<String, dynamic> _$$ReportsManagementStateImplToJson(
        _$ReportsManagementStateImpl instance) =>
    <String, dynamic>{
      'status': _$ReportsManagementStateStatusEnumMap[instance.status]!,
      'dailyStandups': instance.dailyStandups,
      'weeklyReport': instance.weeklyReport,
      'errorMessage': instance.errorMessage,
    };

const _$ReportsManagementStateStatusEnumMap = {
  ReportsManagementStateStatus.initial: 'initial',
  ReportsManagementStateStatus.loading: 'loading',
  ReportsManagementStateStatus.loaded: 'loaded',
};
