import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

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
    final appThemes = Nylo.getAppThemes();
    return Container(
      color: Colors.white,
      child: LocalizedApp(
        child: ThemeProvider(
          themes: appThemes,
          child: ThemeConsumer(
            child: ValueListenableBuilder(
              valueListenable: ValueNotifier(NyLocalization.instance.locale),
              builder: (context, locale, _) => MaterialApp(
                navigatorKey: navigatorKey,
                themeMode: themeMode,
                navigatorObservers: navigatorObservers,
                debugShowCheckedModeBanner: false,
                darkTheme: appThemes.darkTheme,
                initialRoute: initialRoute,
                onGenerateRoute: onGenerateRoute,
                onUnknownRoute: onUnknownRoute,
                theme: ThemeProvider.themeOf(context).data,
                localeResolutionCallback: (locale, supportedLocales) {
                  return locale;
                },
                localizationsDelegates: NyLocalization.instance.delegates,
                locale: locale,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
