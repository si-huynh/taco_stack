import 'package:nylo_framework/nylo_framework.dart';

class PushNotificationsProvider implements NyProvider {
  @override
  Future<Nylo> boot(Nylo nylo) async {
    nylo.useLocalNotifications();

    return nylo;
  }

  @override
  Future<void> afterBoot(Nylo nylo) async {
    // Called after booting your provider
    // ...
  }
}
