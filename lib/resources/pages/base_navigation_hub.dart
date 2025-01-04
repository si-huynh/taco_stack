import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
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
              title: trans('home'),
              page:
                  DashboardPage(), // create using: 'dart run nylo_framework:main make:stateful_widget home_tab'
              icon: const Icon(Icons.home),
              activeIcon: const Icon(Icons.home),
            ),
            1: NavigationTab(
              title: trans('settings'),
              page:
                  SettingsPage(), // create using: 'dart run nylo_framework:main make:stateful_widget settings_tab'
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
}
