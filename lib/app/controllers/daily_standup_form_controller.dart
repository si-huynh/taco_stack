import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taco_stack_app/app/blocs/daily_standup_cubit/daily_standup_cubit.dart';
import 'package:taco_stack_app/app/models/daily_standup.dart';

import '/app/controllers/controller.dart';

class DailyStandupFormController extends Controller {
  late DailyStandupCubit _dailyStandupCubit;

  @override
  bool get singleton => true;

  @override
  DailyStandupFormController construct(BuildContext context) {
    super.construct(context);
    _dailyStandupCubit = context.read<DailyStandupCubit>();
    return this;
  }

  Future<Either<DailyStandup, String>> submitForm(
    Map<String, dynamic> data,
    DateTime date,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    return _dailyStandupCubit.createDailyStandup(data, date);
  }
}
