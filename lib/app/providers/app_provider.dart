import 'package:nylo_framework/nylo_framework.dart';

import '/app/forms/style/form_style.dart';
import '/config/decoders.dart';
import '/config/design.dart';
import '/config/form_casts.dart';
import '/config/keys.dart';
import '/config/localization.dart';
import '/config/theme.dart';
import '/config/validation_rules.dart';

class AppProvider implements NyProvider {
  @override
  Future<Nylo> boot(Nylo nylo) async {
    await NyLocalization.instance.init(
      languageCode: languageCode,
    );

    nylo.addLoader(loader);
    nylo.addLogo(logo);
    nylo.addThemes(appThemes);
    nylo.addToastNotification(getToastNotificationWidget);
    nylo.addValidationRules(validationRules);
    nylo.addModelDecoders(modelDecoders);
    nylo.addControllers(controllers);
    nylo.addApiDecoders(apiDecoders);
    nylo.addFormCasts(formCasts);
    nylo.useErrorStack();
    nylo.addFormStyle(FormStyle());
    nylo.addAuthKey(Keys.auth);
    await nylo.syncKeys(Keys.syncedOnBoot);

    // Optional
    // nylo.showDateTimeInLogs(); // Show date time in logs
    // nylo.monitorAppUsage(); // Monitor the app usage

    return nylo;
  }

  @override
  Future<void> afterBoot(Nylo nylo) async {}
}
