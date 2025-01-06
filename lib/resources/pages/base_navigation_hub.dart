import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';
import 'package:taco_stack_app/app/blocs/user_info_cubit/user_info_cubit.dart';
import 'package:taco_stack_app/resources/pages/dashboard_page.dart';
import 'package:taco_stack_app/resources/pages/settings_page.dart';

class BaseNavigationHub extends NyStatefulWidget with BottomNavPageControls {
  BaseNavigationHub({super.key})
      : super(
          child: _BaseNavigationHubState.new,
          stateName: path.stateName(),
        );
  static RouteView path = ('/base', (_) => BaseNavigationHub());

  static NavigationHubStateActions stateActions =
      NavigationHubStateActions(path.stateName());
}

class _BaseNavigationHubState extends NavigationHub<BaseNavigationHub> {
  /// Navigation pages
  _BaseNavigationHubState()
      : super(() async {
          return {
            0: NavigationTab(
              title: trans('dashboard'),
              page: DashboardPage(),
              icon: const Icon(Icons.dashboard),
              activeIcon: const Icon(Icons.dashboard),
            ),
            1: NavigationTab(
              title: trans('settings'),
              page: SettingsPage(),
              icon: const Icon(Icons.settings),
              activeIcon: const Icon(Icons.settings),
            ),
          };
        });

  @override
  NavigationHubLayout? get layout => NavigationHubLayout.bottomNav(
        type: BottomNavigationBarType.fixed,
      );

  @override
  bool get maintainState => true;

  @override
  void onTap(int index) {
    super.onTap(index);
  }

  @override
  Widget view(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserInfoCubit(),
        ),
        BlocProvider(
          create: (context) => ReportsManagementCubit(),
        ),
      ],
      child: super.view(context),
    );
  }
}
