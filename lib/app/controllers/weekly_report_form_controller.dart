import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';
import 'package:taco_stack_app/app/models/weekly_report.dart';

import '/app/controllers/controller.dart';

class WeeklyReportFormController extends Controller {
  late ReportsManagementCubit _reportsManagementCubit;

  @override
  bool get singleton => true;

  @override
  WeeklyReportFormController construct(BuildContext context) {
    super.construct(context);
    _reportsManagementCubit = context.read<ReportsManagementCubit>();
    return this;
  }

  Future<Either<WeeklyReport, String>> submitForm(
    Map<String, dynamic> data,
    DateTime date, {
    String id = '',
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (id.isNotEmpty) {
      return _reportsManagementCubit.updateWeeklyReport(data, id);
    }
    return _reportsManagementCubit.createWeeklyReport(data, date);
  }
}
