import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString,
) {
  final baseTextTheme = Theme.of(context).textTheme;
  final bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  final displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  final textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

extension DesignThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  //TextTheme get textTheme => theme.textTheme;
}

extension DimensionContext on BuildContext {
  double get sw => MediaQuery.of(this).size.width;
  double get sh => MediaQuery.of(this).size.height;
  EdgeInsets get padding => MediaQuery.of(this).viewPadding;
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
  double get containerMaxHeight => sh - padding.top - padding.bottom;
}
