// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyReport _$WeeklyReportFromJson(Map<String, dynamic> json) => WeeklyReport(
      id: json['id'] as String,
      summary: json['summary'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      weekNo: (json['week_no'] as num).toInt(),
      tasksCompleted: json['tasks_completed'] as String,
      challengesFaced: json['challenges_faced'] as String,
      nextWeekPlan: json['next_week_plan'] as String,
      userId: json['user_id'] as String,
      weekEnding: DateTime.parse(json['week_ending'] as String),
      isSkipped: json['is_skipped'] as bool,
      isCollected: json['is_collected'] as bool,
    );

Map<String, dynamic> _$WeeklyReportToJson(WeeklyReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'created_at': instance.createdAt.toIso8601String(),
      'week_no': instance.weekNo,
      'tasks_completed': instance.tasksCompleted,
      'challenges_faced': instance.challengesFaced,
      'next_week_plan': instance.nextWeekPlan,
      'user_id': instance.userId,
      'week_ending': instance.weekEnding.toIso8601String(),
      'is_skipped': instance.isSkipped,
      'is_collected': instance.isCollected,
    };
