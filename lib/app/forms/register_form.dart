import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* Register Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class RegisterForm extends NyFormData {
  RegisterForm({String? name}) : super(name ?? 'register');

  @override
  List<Object> fields() => [
        [
          Field.text(
            trans('firstName'),
            autofocus: true,
            validate: FormValidator.notEmpty(),
            style: 'default',
          ),
          Field.text(
            trans('lastName'),
            validate: FormValidator.notEmpty(),
            style: 'default',
          ),
        ],
        Field.text(
          trans('department'),
          validate: FormValidator.notEmpty(),
          style: 'default',
        ),
        Field.text(
          trans('email'),
          validate: FormValidator.email(),
          prefixIcon: const Icon(Icons.email),
          style: 'default',
        ),
        Field.text(
          trans('password'),
          validate: FormValidator.password(),
          style: 'default'.extend(),
          prefixIcon: const Icon(Icons.lock),
        ),
      ];
}
