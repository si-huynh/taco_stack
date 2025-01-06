import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/controllers/authentication_controller.dart';
import 'package:taco_stack_app/app/forms/login_form.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';
import 'package:taco_stack_app/resources/widgets/buttons/buttons.dart';
import 'package:taco_stack_app/resources/widgets/logo_widget.dart';

class SignInPage extends NyStatefulWidget<AuthenticationController> {
  SignInPage({super.key}) : super(child: _SignInPageState.new);

  static RouteView path = ('/sign-in', (_) => SignInPage());
}

class _SignInPageState extends NyPage<SignInPage> {
  final _loginForm = LoginForm();

  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal();

  @override
  Function() get init => () {
        if (kDebugMode) {
          _loginForm.initialData(() {
            return {
              'email': 'john.doe@gmail.com',
              'password': 'passworD@123',
            };
          });
        }
      };

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          height: context.containerMaxHeight - kToolbarHeight,
          child: Column(
            children: [
              const Spacer(),
              const Logo(),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: NyForm(
                  form: _loginForm,
                  footerSpacing: 32,
                  footer: Button.rounded(
                    text: trans('signIn'),
                    submitForm: (_loginForm, _onSubmit),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSubmit(data) async {
    setLoading(true, resetState: false);
    final result = await widget.controller.loginWithEmail(
      email: data['email'],
      password: data['password'],
    );
    setLoading(false, resetState: false);
    if (result != null) {
      showToastWarning(description: result);
    } else {
      routeToAuthenticatedRoute();
    }
  }
}
