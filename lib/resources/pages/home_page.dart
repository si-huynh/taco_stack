import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/home_controller.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/safearea_widget.dart';

class HomePage extends NyStatefulWidget<HomeController> {
  HomePage({super.key}) : super(child: _HomePageState.new);
  static RouteView path = ('/home', (_) => HomePage());
}

class _HomePageState extends NyPage<HomePage> {
  @override
  Future<void> Function() get init => () async {};

  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal();

  /// The [view] method displays your page.
  @override
  Widget view(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showToastSuccess(title: 'Hello 👋', description: 'Welcome to Nylo');
        },
        child: const Icon(Icons.notifications),
      ),
      body: const SafeAreaWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
          ],
        ),
      ),
    );
  }
}
