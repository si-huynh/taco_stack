import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NotFoundPage extends NyStatefulWidget {

  NotFoundPage({super.key}) : super(child: _NotFoundPageState.new);
  static RouteView path = ('/not-found', (_) => NotFoundPage());
}

class _NotFoundPageState extends NyState<NotFoundPage> {
  @override
  Null Function() get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: const SafeArea(
        child: Center(
          child: Text('Page not found'),
        ),
      ),
    );
  }
}
