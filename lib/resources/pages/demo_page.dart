import 'package:flutter/material.dart';
import 'package:flutter_app/app/forms/login_form.dart';
import 'package:flutter_app/resources/widgets/theme_toggle_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DemoPage extends NyStatefulWidget {
  static RouteView path = ("/demo", (_) => DemoPage());

  DemoPage({super.key}) : super(child: () => _DemoPageState());
}

class _DemoPageState extends NyPage<DemoPage> {
  LoginForm form = LoginForm();

  @override
  get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")),
      body: SafeArea(
        child: NyForm.list(form: form, children: [
          ThemeToggle()
        ],),
      ),
    );
  }
}
