import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bootstrap/boot.dart';

void main() async {
  await Nylo.init(
    setup: Boot.nylo,
    setupFinished: Boot.finished,
    showSplashScreen: true,
  );

  await Supabase.initialize(
    url: getEnv('SUPABASE_PROJECT_URL'),
    anonKey: getEnv('SUPABASE_ANON_PUBLIC_KEY'),
  );
}
