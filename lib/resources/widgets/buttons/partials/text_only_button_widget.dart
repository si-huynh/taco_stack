import 'package:flutter/material.dart';
import '/bootstrap/extensions.dart';
import '/resources/widgets/buttons/abstract/app_button.dart';

class TextOnlyButton extends AppButton {

  const TextOnlyButton({
    super.key,
    required super.text,
    super.onPressed,
    this.textColor,
    super.submitForm,
    super.width,
    super.height,
  });
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: buildButtonChild(
        context,
        textColor: textColor ?? context.color.content,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
