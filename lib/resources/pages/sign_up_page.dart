import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/forms/register_form.dart';
import 'package:taco_stack_app/resources/widgets/buttons/buttons.dart';
import 'package:taco_stack_app/resources/widgets/logo_widget.dart';

class SignUpPage extends NyStatefulWidget {

  SignUpPage({super.key}) : super(child: _SignUpPageState.new);
  static RouteView path = ('/sign-up', (_) => SignUpPage());
}

class _SignUpPageState extends NyPage<SignUpPage> {
  @override
  Null Function() get init => () {};

  final _registerForm = RegisterForm();

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Logo(),
          const Gap(32),
          Text(
            trans('createAnAccount'),
          ).headingMedium().alignCenter(),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(trans('alreadyHaveAnAccount')),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
                child: Text(trans('login')),
              ),
            ],
          ),
          const Gap(32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: NyForm(
              form: _registerForm,
              footerSpacing: 32,
              footer: Button.rounded(
                text: 'Continue',
                submitForm: (_registerForm, (data) {}),
              ),
            ),
          ),
          const Gap(32),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.google)),
              const Gap(16),
              IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.apple)),
              const Gap(16),
              IconButton(
                  onPressed: () {}, icon: const Icon(FontAwesomeIcons.facebook),),
            ],
          ),
          const Spacer(),
          Text(trans('signUpFooter'))
              .bodySmall()
              .alignCenter()
              .paddingSymmetric(horizontal: 32),
        ],
      ),),
    );
  }
}
