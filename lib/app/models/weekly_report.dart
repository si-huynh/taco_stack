import 'package:json_annotation/json_annotation.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';

part 'weekly_report.g.dart';

@JsonSerializable()
class WeeklyReport {
  WeeklyReport({
    required this.id,
    required this.summary,
    required this.createdAt,
    required this.weekNo,
    required this.tasksCompleted,
    required this.challengesFaced,
    required this.nextWeekPlan,
    required this.userId,
    required this.weekEnding,
    required this.isSkipped,
    required this.isCollected,
  });

  factory WeeklyReport.fromJson(Map<String, dynamic> json) =>
      _$WeeklyReportFromJson(json);

  factory WeeklyReport.placeholder(DateTime date) => WeeklyReport(
        id: '',
        summary: '',
        createdAt: date,
        weekNo: 0,
        tasksCompleted: '',
        challengesFaced: '',
        nextWeekPlan: '',
        userId: '',
        weekEnding: date.mostRecentSunday,
        isSkipped: false,
        isCollected: false,
      );

  Map<String, dynamic> toJson() => _$WeeklyReportToJson(this);

  final String id;
  final String summary;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'week_no')
  final int weekNo;
  @JsonKey(name: 'tasks_completed')
  final String tasksCompleted;
  @JsonKey(name: 'challenges_faced')
  final String challengesFaced;
  @JsonKey(name: 'next_week_plan')
  final String nextWeekPlan;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'week_ending')
  final DateTime weekEnding;
  @JsonKey(name: 'is_skipped')
  final bool isSkipped;
  @JsonKey(name: 'is_collected')
  final bool isCollected;
}
