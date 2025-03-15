import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taco_stack_app/app/blocs/app_settings_cubit/app_settings_cubit.dart';
import 'package:taco_stack_app/resources/pages/settings_page.dart';

import '/app/controllers/controller.dart';

class SettingsController extends Controller {
  final _supaBaseClient = Supabase.instance.client;

  late AppSettingsCubit _appSettingsCubit;

  @override
  bool get singleton => true;

  @override
  String get state => SettingsPage.path.name;

  @override
  SettingsController construct(BuildContext context) {
    super.construct(context);
    _appSettingsCubit = context.read<AppSettingsCubit>();
    return this;
  }

  Future<void> updateLocale() async {
    if (NyLocalization.instance.languageCode == 'en') {
      _appSettingsCubit.setLocale('vi');
      changeLanguage('vi');
    } else {
      _appSettingsCubit.setLocale('en');
      changeLanguage('en');
    }
  }

  Future<void> signOut() async {
    try {
      await _supaBaseClient.auth.signOut();
      await Auth.logout();
      routeToInitial();
    } catch (e) {
      throw Exception('Authentication failed');
    }
  }

  void updateSettingsNumber() {
    updateState(
      state,
      data: {
        'settingsNumber': 10,
      },
    );
  }
}
