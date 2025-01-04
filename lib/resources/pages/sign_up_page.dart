import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/controllers/authentication_controller.dart';
import 'package:taco_stack_app/app/forms/register_form.dart';
import 'package:taco_stack_app/resources/pages/sign_in_page.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';
import 'package:taco_stack_app/resources/widgets/buttons/buttons.dart';
import 'package:taco_stack_app/resources/widgets/logo_widget.dart';

class SignUpPage extends NyStatefulWidget<AuthenticationController> {
  SignUpPage({super.key}) : super(child: _SignUpPageState.new);
  static RouteView path = ('/sign-up', (_) => SignUpPage());
}

class _SignUpPageState extends NyPage<SignUpPage> {
  final _registerForm = RegisterForm();

  @override
  Function() get init => () {
        if (kDebugMode) {
          _registerForm.initialData(() {
            return {
              'first_name': 'John',
              'last_name': 'Doe',
              'department': 'Engineering',
              'email': 'john.doe@gmail.com',
              'password': 'passworD@123',
            };
          });
        }
      };

  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal();

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.containerMaxHeight,
          child: Column(
            children: [
              const Spacer(),
              const Logo(),
              const Gap(16),
              Text(
                trans('createAnAccount'),
              ).headingMedium().alignCenter(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(trans('alreadyHaveAnAccount')),
                  TextButton(
                    onPressed: () {
                      routeTo(SignInPage.path);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text(trans('signIn')),
                  ),
                ],
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NyForm(
                  form: _registerForm,
                  footerSpacing: 32,
                  footer: Button.rounded(
                    text: trans('signUp'),
                    submitForm: (_registerForm, _onSubmit),
                  ),
                  locked: isLoading(name: 'loading'),
                  loadingStyle: LoadingStyle.skeletonizer(),
                ),
              ),
              const Gap(16),
              Row(
                children: [
                  const Gap(32),
                  const Expanded(child: Divider()),
                  const Gap(8),
                  Text(trans('orSignUpWith')),
                  const Gap(8),
                  const Expanded(child: Divider()),
                  const Gap(32),
                ],
              ),
              const Gap(16),
              _buildSocialButtons(),
              const Spacer(),
              Text(trans('signUpFooter'))
                  .bodySmall()
                  .alignCenter()
                  .paddingSymmetric(horizontal: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.google),
          ),
          const Gap(16),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.apple),
          ),
          const Gap(16),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.facebook),
          ),
        ],
      );

  Future<void> _onSubmit(data) async {
    setLoading(true, resetState: false);
    final errorMessage = await widget.controller.signUpWithEmail(
      email: data['email'],
      password: data['password'],
      data: data,
    );
    setLoading(false, resetState: false);
    if (errorMessage != null) {
      showToastWarning(description: errorMessage);
    } else {
      routeToAuthenticatedRoute();
    }
  }
}
