import 'package:nylo_framework/nylo_framework.dart';

import '/config/events.dart';

class EventProvider implements NyProvider {
  @override
  Future<Nylo> boot(Nylo nylo) async {
    nylo.addEvents(events);

    return nylo;
  }

  @override
  Future<void> afterBoot(Nylo nylo) async {
    nylo.addEventBus();
  }
}
