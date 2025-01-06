// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_standup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyStandup _$DailyStandupFromJson(Map<String, dynamic> json) => DailyStandup(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      weekNo: (json['week_no'] as num).toInt(),
      planForTomorrow: json['plan_for_tomorrow'] as String,
      challenges: json['challenges'] as String,
      progress: json['progress'] as String,
      userId: json['user_id'] as String,
      date: DateTime.parse(json['date'] as String),
      isSkipped: json['is_skipped'] as bool,
      isCollected: json['is_collected'] as bool,
    );

Map<String, dynamic> _$DailyStandupToJson(DailyStandup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'week_no': instance.weekNo,
      'plan_for_tomorrow': instance.planForTomorrow,
      'challenges': instance.challenges,
      'progress': instance.progress,
      'user_id': instance.userId,
      'date': instance.date.toIso8601String(),
      'is_skipped': instance.isSkipped,
      'is_collected': instance.isCollected,
    };
