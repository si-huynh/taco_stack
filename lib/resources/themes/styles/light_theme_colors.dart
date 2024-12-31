import 'package:flutter/material.dart';
import '/resources/themes/styles/color_styles.dart';

/* Light Theme Colors
|-------------------------------------------------------------------------- */

class LightThemeColors implements ColorStyles {
  // general
  @override
  Color get background => const Color(0xfffff8f3);

  @override
  Color get content => const Color(0xff201b13);
  @override
  Color get primaryAccent => const Color(0xff7d570e);

  @override
  Color get surfaceBackground => const Color(0xfffff8f3);
  @override
  Color get surfaceContent => const Color(0xff201b13);

  // app bar
  @override
  Color get appBarBackground => const Color(0xfffff8f3);
  @override
  Color get appBarPrimaryContent => const Color(0xff201b13);

  // buttons
  @override
  Color get buttonBackground => const Color(0xff7d570e);
  @override
  Color get buttonContent => const Color(0xffffffff);

  @override
  Color get buttonSecondaryBackground => const Color(0xfff9dfbb);
  @override
  Color get buttonSecondaryContent =>
      Colors.white.withAlpha((255.0 * 0.9).round());

  // bottom tab bar
  @override
  Color get bottomTabBarBackground => const Color(0xfff8ecdf);

  // bottom tab bar - icons
  @override
  Color get bottomTabBarIconSelected => const Color(0xff7d570e);
  @override
  Color get bottomTabBarIconUnselected => const Color(0xff4e4539);

  // bottom tab bar - label
  @override
  Color get bottomTabBarLabelUnselected => const Color(0xff7d570e);
  @override
  Color get bottomTabBarLabelSelected => const Color(0xff4e4539);

  // toast notification
  @override
  Color get toastNotificationBackground => Colors.white;
}
