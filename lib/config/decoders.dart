import 'package:taco_stack_app/app/models/github_info.dart';

import '/app/controllers/authentication_controller.dart';
import '/app/controllers/daily_standup_form_controller.dart';
import '/app/controllers/dashboard_controller.dart';
import '/app/controllers/settings_controller.dart';
import '/app/controllers/weekly_report_form_controller.dart';
import '/app/networking/api_service.dart';

/* Model Decoders
|--------------------------------------------------------------------------
| Model decoders are used in 'app/networking/' for morphing json payloads
| into Models.
|
| Learn more https://nylo.dev/docs/6.x/decoders#model-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> modelDecoders = {
  Map<String, dynamic>: (data) => Map<String, dynamic>.from(data),
  GithubInfo: GithubInfo.fromJson,
};

/* API Decoders
| -------------------------------------------------------------------------
| API decoders are used when you need to access an API service using the
| 'api' helper. E.g. api<MyApiService>((request) => request.fetchData());
|
| Learn more https://nylo.dev/docs/6.x/decoders#api-decoders
|-------------------------------------------------------------------------- */

final Map<Type, dynamic> apiDecoders = {
  ApiService: ApiService.new,

  // ...
};

/* Controller Decoders
| -------------------------------------------------------------------------
| Controller are used in pages.
|
| Learn more https://nylo.dev/docs/6.x/controllers
|-------------------------------------------------------------------------- */
final Map<Type, dynamic> controllers = {
  AuthenticationController: AuthenticationController.new,
  SettingsController: SettingsController.new,
  DashboardController: DashboardController.new,
  DailyStandupFormController: DailyStandupFormController.new,
  WeeklyReportFormController: WeeklyReportFormController.new,
};
