import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isThemeDark = context.isThemeDark;

    if (context.isDeviceInDarkMode) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dark Mode', textAlign: TextAlign.center).fontWeightBold(),
            const Text(
                'Your device is in Dark Mode, turn off Dark Mode from your device settings to change the theme',
                textAlign: TextAlign.center,),
          ],
        ),
      );
    }

    return Column(
      children: [
        Switch(
            value: isThemeDark,
            onChanged: (_) {
              NyTheme.set(context,
                  id: getEnv(isThemeDark != true
                      ? 'DARK_THEME_ID'
                      : 'LIGHT_THEME_ID',),);
            },),
        Text("${isThemeDark ? "Dark" : "Light"} Mode"),
      ],
    );
  }
}
