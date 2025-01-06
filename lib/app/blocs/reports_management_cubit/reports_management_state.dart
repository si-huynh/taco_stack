part of 'reports_management_cubit.dart';

@freezed
class ReportsManagementState with _$ReportsManagementState {
  const factory ReportsManagementState({
    @Default(ReportsManagementStateStatus.initial)
    ReportsManagementStateStatus status,
    @Default([]) List<DailyStandup> dailyStandups,
    required WeeklyReport weeklyReport,
    @Default(null) String? errorMessage,
  }) = _ReportsManagementState;

  factory ReportsManagementState.fromJson(Map<String, dynamic> json) =>
      _$ReportsManagementStateFromJson(json);
}

enum ReportsManagementStateStatus {
  initial,
  loading,
  loaded,
}
