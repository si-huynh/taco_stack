// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_standup_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyStandupStateImpl _$$DailyStandupStateImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyStandupStateImpl(
      status: $enumDecodeNullable(
              _$DailyStandupStateStatusEnumMap, json['status']) ??
          DailyStandupStateStatus.initial,
      dailyStandups: (json['dailyStandups'] as List<dynamic>?)
              ?.map((e) => DailyStandup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weeklyReport:
          WeeklyReport.fromJson(json['weeklyReport'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String? ?? null,
    );

Map<String, dynamic> _$$DailyStandupStateImplToJson(
        _$DailyStandupStateImpl instance) =>
    <String, dynamic>{
      'status': _$DailyStandupStateStatusEnumMap[instance.status]!,
      'dailyStandups': instance.dailyStandups,
      'weeklyReport': instance.weeklyReport,
      'errorMessage': instance.errorMessage,
    };

const _$DailyStandupStateStatusEnumMap = {
  DailyStandupStateStatus.initial: 'initial',
  DailyStandupStateStatus.loading: 'loading',
  DailyStandupStateStatus.loaded: 'loaded',
};
