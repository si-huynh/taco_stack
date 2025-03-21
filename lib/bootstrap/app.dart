import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/blocs/app_settings_cubit/app_settings_cubit.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';

/// Main entry point for the application
class Main extends StatelessWidget {
  Main(
    Nylo nylo, {
    super.key,
  })  : onGenerateRoute = nylo.router!.generator(),
        onUnknownRoute = nylo.router!.unknownRoute(),
        navigatorKey = NyNavigator.instance.router.navigatorKey,
        initialRoute = nylo.getInitialRoute(),
        navigatorObservers = nylo.getNavigatorObservers(),
        themeMode = ThemeMode.system;
  final String? initialRoute;
  final ThemeMode themeMode;
  final List<NavigatorObserver> navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Route<dynamic>? Function(RouteSettings settings) onGenerateRoute;
  final Route<dynamic>? Function(RouteSettings settings) onUnknownRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingsCubit(localeName: 'vi'),
        ),
        BlocProvider(
          create: (context) => ReportsManagementCubit(),
        ),
      ],
      child: _buildAppContent(),
    );
  }

  Widget _buildAppContent() {
    final appThemes = Nylo.getAppThemes();
    return Container(
      color: Colors.white,
      child: LocalizedApp(
        child: ThemeProvider(
          themes: appThemes,
          child: ThemeConsumer(
            child: ValueListenableBuilder(
              valueListenable: ValueNotifier(NyLocalization.instance.locale),
              builder: (context, locale, _) {
                return BlocBuilder<AppSettingsCubit, AppSettingsState>(
                  builder: (context, state) => MaterialApp(
                    navigatorKey: navigatorKey,
                    themeMode: themeMode,
                    navigatorObservers: navigatorObservers,
                    debugShowCheckedModeBanner: false,
                    darkTheme: appThemes.darkTheme,
                    initialRoute: initialRoute,
                    onGenerateRoute: onGenerateRoute,
                    onUnknownRoute: onUnknownRoute,
                    theme: ThemeProvider.themeOf(context).data.copyWith(
                          pageTransitionsTheme: const PageTransitionsTheme(
                            builders: {
                              TargetPlatform.iOS:
                                  CupertinoPageTransitionsBuilder(),
                              TargetPlatform.android:
                                  CupertinoPageTransitionsBuilder(),
                            },
                          ),
                        ),
                    localeResolutionCallback: (locale, supportedLocales) {
                      return supportedLocales.firstWhere(
                        (item) => item.languageCode == state.localeName,
                        orElse: () => supportedLocales.first,
                      );
                    },
                    localizationsDelegates: NyLocalization.instance.delegates,
                    locale: Locale(state.localeName),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
