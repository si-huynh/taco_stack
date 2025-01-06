import '/resources/pages/weekly_report_form_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/resources/pages/base_navigation_hub.dart';
import '/resources/pages/daily_standup_form_page.dart';
import '/resources/pages/dashboard_page.dart';
import '/resources/pages/not_found_page.dart';
import '/resources/pages/settings_page.dart';
import '/resources/pages/sign_in_page.dart';
import '/resources/pages/sign_up_page.dart';

NyRouter appRouter() => nyRoutes((router) {
      router.add(NotFoundPage.path).unknownRoute();
      router.add(SignUpPage.path).initialRoute();
      router.add(SignInPage.path);
      router.add(SettingsPage.path);
      router.add(DashboardPage.path);
      router.add(BaseNavigationHub.path).authenticatedRoute();
      router.add(DailyStandupFormPage.path);
      router.add(WeeklyReportFormPage.path);
});
