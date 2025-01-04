import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Login Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class LoginForm extends NyFormData {
  LoginForm({String? name}) : super(name ?? 'login');

  @override
  List<Field> fields() => [
        Field.text(
          'Email',
          autofocus: true,
          validate: FormValidator.rule('email'),
          prefixIcon: const Icon(Icons.email),
        ),
        Field.text(
          'Password',
          validate: FormValidator.notEmpty(),
          prefixIcon: const Icon(Icons.password),
        ),
      ];
}
