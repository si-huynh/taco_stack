import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/resources/widgets/buttons/partials/rounded_button_widget.dart';
import '/app/controllers/settings_controller.dart';

class SettingsPage extends NyStatefulWidget<SettingsController> {
  SettingsPage({super.key}) : super(child: _SettingsPageState.new);
  static RouteView path = ('/settings', (_) => SettingsPage());
}

class _SettingsPageState extends NyState<SettingsPage> {
  SettingsController get controller => widget.controller;

  @override
  Null Function() get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: RoundedButton(
          text: trans('signOut'),
          onPressed: () => controller.signOut(),
        ),
      ),
    );
  }
}
