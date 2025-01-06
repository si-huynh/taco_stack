part of 'daily_standup_cubit.dart';

@freezed
class DailyStandupState with _$DailyStandupState {
  const factory DailyStandupState({
    @Default(DailyStandupStateStatus.initial) DailyStandupStateStatus status,
    @Default([]) List<DailyStandup> dailyStandups,
    required WeeklyReport weeklyReport,
    @Default(null) String? errorMessage,
  }) = _DailyStandupState;

  factory DailyStandupState.fromJson(Map<String, dynamic> json) =>
      _$DailyStandupStateFromJson(json);
}

enum DailyStandupStateStatus {
  initial,
  loading,
  loaded,
}
