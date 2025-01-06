import 'package:json_annotation/json_annotation.dart';

part 'daily_standup.g.dart';

@JsonSerializable()
class DailyStandup {
  DailyStandup({
    required this.id,
    required this.createdAt,
    required this.weekNo,
    required this.planForTomorrow,
    required this.challenges,
    required this.progress,
    required this.userId,
    required this.date,
    required this.isSkipped,
    required this.isCollected,
  });

  factory DailyStandup.placeholder(DateTime date) => DailyStandup(
        id: '',
        createdAt: date,
        weekNo: 0,
        planForTomorrow: '',
        challenges: '',
        progress: '',
        userId: '',
        date: date,
        isCollected: false,
        isSkipped: false,
      );

  factory DailyStandup.fromJson(Map<String, dynamic> json) =>
      _$DailyStandupFromJson(json);

  Map<String, dynamic> toJson() => _$DailyStandupToJson(this);

  final String id;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'week_no')
  final int weekNo;
  @JsonKey(name: 'plan_for_tomorrow')
  final String planForTomorrow;
  final String challenges;
  final String progress;
  @JsonKey(name: 'user_id')
  final String userId;
  final DateTime date;
  @JsonKey(name: 'is_skipped')
  final bool isSkipped;
  @JsonKey(name: 'is_collected')
  final bool isCollected;
}
