import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taco_stack_app/app/models/daily_standup.dart';
import 'package:taco_stack_app/app/models/weekly_report.dart';

part 'reports_management_state.dart';
part 'reports_management_cubit.g.dart';
part 'reports_management_cubit.freezed.dart';

class ReportsManagementCubit extends Cubit<ReportsManagementState> {
  ReportsManagementCubit()
      : _weekNo = DateTime.now().weekOfYear,
        super(
          ReportsManagementState(
            weeklyReport: WeeklyReport.placeholder(DateTime.now()),
            dailyStandups: List.generate(7, (index) {
              final monday = DateTime.now().mostRecentMonday;
              return DailyStandup.placeholder(
                monday.add(Duration(days: index)),
              );
            }),
          ),
        );

  final _supaBaseClient = Supabase.instance.client;

  final int _weekNo;

  DailyStandup? get today => state.dailyStandups
      .where(
        (item) => item.date.isSameDay(DateTime.now()),
      )
      .firstOrNull;

  Future<void> fetchDailyStandup() async {
    emit(state.copyWith(status: ReportsManagementStateStatus.loading));
    try {
      final dailyStandupsResponse = await _supaBaseClient
          .from('daily_standups')
          .select()
          .eq('week_no', _weekNo);
      final weeklyReportResponse = await _supaBaseClient
          .from('weekly_reports')
          .select()
          .eq('week_no', _weekNo);

      final dailyStandups =
          dailyStandupsResponse.map(DailyStandup.fromJson).toList();
      final weeklyReport =
          weeklyReportResponse.map(WeeklyReport.fromJson).firstOrNull;

      final availableDates =
          dailyStandups.map((item) => item.date.toFormat('dd/mm/yyyy'));

      emit(
        state.copyWith(
          dailyStandups: state.dailyStandups.map((item) {
            if (availableDates.contains(item.date.toFormat('dd/mm/yyyy'))) {
              return dailyStandups
                  .firstWhere((element) => element.date.isSameDay(item.date));
            }
            return item;
          }).toList()
            ..sort((a, b) => a.date.compareTo(b.date)),
          weeklyReport:
              weeklyReport ?? WeeklyReport.placeholder(DateTime.now()),
          errorMessage: null,
          status: ReportsManagementStateStatus.loaded,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: ReportsManagementStateStatus.loaded,
        ),
      );
    }
  }

  Future<Either<DailyStandup, String>> createDailyStandup(
    Map<String, dynamic> data,
    DateTime date,
  ) async {
    try {
      data['week_no'] = date.weekOfYear;
      data['date'] = date.toIso8601String();
      data['user_id'] = Session.fromJson(Auth.data())?.user.id;
      data['is_skipped'] = false;
      data['is_collected'] = false;
      final response =
          await _supaBaseClient.from('daily_standups').insert(data).select();
      return left(DailyStandup.fromJson(response.first));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return right(e.toString());
    }
  }

  Future<Either<WeeklyReport, String>> createWeeklyReport(
    Map<String, dynamic> data,
    DateTime date,
  ) async {
    try {
      data['week_no'] = date.weekOfYear;
      data['week_ending'] = date.mostRecentSunday.toIso8601String();
      data['user_id'] = Session.fromJson(Auth.data())?.user.id;
      data['is_skipped'] = false;
      data['is_collected'] = false;
      final response =
          await _supaBaseClient.from('weekly_reports').insert(data).select();
      return left(WeeklyReport.fromJson(response.first));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return right(e.toString());
    }
  }

  Future<Either<WeeklyReport, String>> updateWeeklyReport(
    Map<String, dynamic> data,
    String id,
  ) async {
    try {
      final response = await _supaBaseClient
          .from('weekly_reports')
          .update(data)
          .eq('id', id)
          .select();
      return left(WeeklyReport.fromJson(response.first));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return right(e.toString());
    }
  }

  Future<Either<DailyStandup, String>> updateDailyStandup(
    Map<String, dynamic> data,
    String id,
  ) async {
    try {
      final response = await _supaBaseClient
          .from('daily_standups')
          .update(data)
          .eq('id', id)
          .select();
      return left(DailyStandup.fromJson(response.first));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return right(e.toString());
    }
  }

  Future<void> skip(DateTime date) async {
    try {
      await _supaBaseClient.from('daily_standups').insert({
        'week_no': date.weekOfYear,
        'date': date.toIso8601String(),
        'user_id': Session.fromJson(Auth.data())?.user.id,
        'is_skipped': true,
        'is_collected': false,
        'plan_for_tomorrow': '',
        'challenges': '',
        'progress': '',
      });
      await fetchDailyStandup();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> collectTaco(String id, String from) async {
    try {
      await _supaBaseClient
          .from(from)
          .update({'is_collected': true}).eq('id', id);
      await fetchDailyStandup();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

extension DateTimeUtil on DateTime {
  DateTime get mostRecentSunday => DateTime(year, month, day - weekday % 7);

  DateTime get mostRecentMonday => DateTime(year, month, day - (weekday - 1));

  int get weekOfYear {
    // Add 3 to always compare with January 4th, which is always in week 1
    // Add 7 to index weeks starting with 1 instead of 0
    final woy = (ordinalDate - weekday + 10) ~/ 7;

    // If the week number equals zero, it means that the given date belongs to the preceding (week-based) year.
    if (woy == 0) {
      // The 28th of December is always in the last week of the year
      return DateTime(year - 1, 12, 28).weekOfYear;
    }

    // If the week number equals 53, one must check that the date is not actually in week 1 of the following year
    if (woy == 53 &&
        DateTime(year).weekday != DateTime.thursday &&
        DateTime(year, 12, 31).weekday != DateTime.thursday) {
      return 1;
    }

    return woy;
  }

  // The ordinal date, the number of days since December 31st the previous year.
  ///
  /// January 1st has the ordinal date 1
  ///
  /// December 31st has the ordinal date 365, or 366 in leap years
  int get ordinalDate {
    const offsets = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }

  /// True if this date is on a leap year.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }
}
