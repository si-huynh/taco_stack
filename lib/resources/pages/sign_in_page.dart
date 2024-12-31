import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SignInPage extends NyStatefulWidget {
  
  SignInPage({super.key}) : super(child: _SignInPageState.new);

  static RouteView path = ('/sign-in', (_) => SignInPage());
}

class _SignInPageState extends NyPage<SignInPage> {

  @override
  Null Function() get init => () {

  };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}
