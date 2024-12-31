import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';

class FormStyle extends NyFormStyle {
  /// TextField styles
  @override
  FormStyleTextField textField(BuildContext context, Field field) {
    return {
      'default': (NyTextField textField) => textField.copyWith(
            decorator: DecoratorTextField(
              decoration: (data, inputDecoration) => inputDecoration.copyWith(
                filled: true,
                isDense: true,
                hintText: field.name,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                  vertical: 13,
                  horizontal: 13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIconColor: context.theme.colorScheme.primary,
              ),
              successDecoration: (data, inputDecoration) =>
                  inputDecoration.copyWith(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
              errorDecoration: (data, inputDecoration) =>
                  inputDecoration.copyWith(
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.primary,
                    width: 2,
                  ),
                ),
                errorStyle: TextStyle(color: context.theme.colorScheme.error),
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: context.theme.colorScheme.error,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
    };
  }
}
