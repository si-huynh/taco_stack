import 'package:flutter/material.dart';

class MaterialTheme {

  const MaterialTheme(this.textTheme);
  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff7d570e),
      surfaceTint: Color(0xff7d570e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdead),
      onPrimaryContainer: Color(0xff281900),
      secondary: Color(0xff6e5b40),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff9dfbb),
      onSecondaryContainer: Color(0xff261904),
      tertiary: Color(0xff4f6442),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd1eabe),
      onTertiaryContainer: Color(0xff0d2005),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff201b13),
      onSurfaceVariant: Color(0xff4e4539),
      outline: Color(0xff807567),
      outlineVariant: Color(0xffd2c4b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inversePrimary: Color(0xfff1be6d),
      primaryFixed: Color(0xffffdead),
      onPrimaryFixed: Color(0xff281900),
      primaryFixedDim: Color(0xfff1be6d),
      onPrimaryFixedVariant: Color(0xff604100),
      secondaryFixed: Color(0xfff9dfbb),
      onSecondaryFixed: Color(0xff261904),
      secondaryFixedDim: Color(0xffdbc3a1),
      onSecondaryFixedVariant: Color(0xff55442a),
      tertiaryFixed: Color(0xffd1eabe),
      onTertiaryFixed: Color(0xff0d2005),
      tertiaryFixedDim: Color(0xffb5cea4),
      onTertiaryFixedVariant: Color(0xff384c2c),
      surfaceDim: Color(0xffe4d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef2e5),
      surfaceContainer: Color(0xfff8ecdf),
      surfaceContainerHigh: Color(0xfff2e6da),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b3d00),
      surfaceTint: Color(0xff7d570e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff966d24),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff514026),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff867254),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff344828),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff657b57),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff201b13),
      onSurfaceVariant: Color(0xff4a4135),
      outline: Color(0xff685e50),
      outlineVariant: Color(0xff84796b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inversePrimary: Color(0xfff1be6d),
      primaryFixed: Color(0xff966d24),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7a550b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff867254),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6b593d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff657b57),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4c6240),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe4d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef2e5),
      surfaceContainer: Color(0xfff8ecdf),
      surfaceContainerHigh: Color(0xfff2e6da),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff311f00),
      surfaceTint: Color(0xff7d570e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5b3d00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2d2009),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff514026),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff14270a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff344828),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f3),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2a2318),
      outline: Color(0xff4a4135),
      outlineVariant: Color(0xff4a4135),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362f27),
      inversePrimary: Color(0xffffe9cc),
      primaryFixed: Color(0xff5b3d00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3e2800),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff514026),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff392a12),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff344828),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1e3214),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe4d8cc),
      surfaceBright: Color(0xfffff8f3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef2e5),
      surfaceContainer: Color(0xfff8ecdf),
      surfaceContainerHigh: Color(0xfff2e6da),
      surfaceContainerHighest: Color(0xffece1d4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff1be6d),
      surfaceTint: Color(0xfff1be6d),
      onPrimary: Color(0xff432c00),
      primaryContainer: Color(0xff604100),
      onPrimaryContainer: Color(0xffffdead),
      secondary: Color(0xffdbc3a1),
      onSecondary: Color(0xff3d2e16),
      secondaryContainer: Color(0xff55442a),
      onSecondaryContainer: Color(0xfff9dfbb),
      tertiary: Color(0xffb5cea4),
      onTertiary: Color(0xff223517),
      tertiaryContainer: Color(0xff384c2c),
      onTertiaryContainer: Color(0xffd1eabe),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff18130b),
      onSurface: Color(0xffece1d4),
      onSurfaceVariant: Color(0xffd2c4b4),
      outline: Color(0xff9b8f80),
      outlineVariant: Color(0xff4e4539),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inversePrimary: Color(0xff7d570e),
      primaryFixed: Color(0xffffdead),
      onPrimaryFixed: Color(0xff281900),
      primaryFixedDim: Color(0xfff1be6d),
      onPrimaryFixedVariant: Color(0xff604100),
      secondaryFixed: Color(0xfff9dfbb),
      onSecondaryFixed: Color(0xff261904),
      secondaryFixedDim: Color(0xffdbc3a1),
      onSecondaryFixedVariant: Color(0xff55442a),
      tertiaryFixed: Color(0xffd1eabe),
      onTertiaryFixed: Color(0xff0d2005),
      tertiaryFixedDim: Color(0xffb5cea4),
      onTertiaryFixedVariant: Color(0xff384c2c),
      surfaceDim: Color(0xff18130b),
      surfaceBright: Color(0xff3f382f),
      surfaceContainerLowest: Color(0xff120d07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff5c271),
      surfaceTint: Color(0xfff1be6d),
      onPrimary: Color(0xff211400),
      primaryContainer: Color(0xffb5893e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0c7a5),
      onSecondary: Color(0xff201402),
      secondaryContainer: Color(0xffa38d6e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb9d2a8),
      onTertiary: Color(0xff081a02),
      tertiaryContainer: Color(0xff809871),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18130b),
      onSurface: Color(0xfffffaf7),
      onSurfaceVariant: Color(0xffd6c9b8),
      outline: Color(0xffada191),
      outlineVariant: Color(0xff8d8173),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inversePrimary: Color(0xff624200),
      primaryFixed: Color(0xffffdead),
      onPrimaryFixed: Color(0xff1a0f00),
      primaryFixedDim: Color(0xfff1be6d),
      onPrimaryFixedVariant: Color(0xff4a3100),
      secondaryFixed: Color(0xfff9dfbb),
      onSecondaryFixed: Color(0xff1a0f00),
      secondaryFixedDim: Color(0xffdbc3a1),
      onSecondaryFixedVariant: Color(0xff43341b),
      tertiaryFixed: Color(0xffd1eabe),
      onTertiaryFixed: Color(0xff041500),
      tertiaryFixedDim: Color(0xffb5cea4),
      onTertiaryFixedVariant: Color(0xff273b1d),
      surfaceDim: Color(0xff18130b),
      surfaceBright: Color(0xff3f382f),
      surfaceContainerLowest: Color(0xff120d07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf7),
      surfaceTint: Color(0xfff1be6d),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfff5c271),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe0c7a5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff2ffe5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb9d2a8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff18130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffffaf7),
      outline: Color(0xffd6c9b8),
      outlineVariant: Color(0xffd6c9b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffece1d4),
      inversePrimary: Color(0xff3b2600),
      primaryFixed: Color(0xffffe3bb),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfff5c271),
      onPrimaryFixedVariant: Color(0xff211400),
      secondaryFixed: Color(0xfffde3bf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe0c7a5),
      onSecondaryFixedVariant: Color(0xff201402),
      tertiaryFixed: Color(0xffd5efc2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb9d2a8),
      onTertiaryFixedVariant: Color(0xff081a02),
      surfaceDim: Color(0xff18130b),
      surfaceBright: Color(0xff3f382f),
      surfaceContainerLowest: Color(0xff120d07),
      surfaceContainerLow: Color(0xff201b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2f2921),
      surfaceContainerHighest: Color(0xff3a342b),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
