import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taco_stack_app/app/blocs/daily_standup_cubit/daily_standup_cubit.dart';
import 'package:taco_stack_app/app/blocs/user_info_cubit/user_info_cubit.dart';

import '/app/controllers/controller.dart';

class DashboardController extends Controller {
  late UserInfoCubit _userInfoCubit;
  late DailyStandupCubit _dailyStandupCubit;

  @override
  bool get singleton => true;

  @override
  DashboardController construct(BuildContext context) {
    super.construct(context);
    _userInfoCubit = context.read<UserInfoCubit>();
    _dailyStandupCubit = context.read<DailyStandupCubit>();
    return this;
  }

  Future<void> loadUserInfo() async {
    return _userInfoCubit.loadUserInfo();
  }

  Future<void> loadDailyStandups() async {
    return _dailyStandupCubit.fetchDailyStandup();
  }

  Future<void> skipDailyStandup(DateTime date) async {
    await _dailyStandupCubit.skip(date);
    await _userInfoCubit.calculateTaco(-1);
  }

  Future<void> collectTaco(String id, String from) async {
    await _dailyStandupCubit.collectTaco(id, from);
    await _userInfoCubit.calculateTaco(1);
  }
}
