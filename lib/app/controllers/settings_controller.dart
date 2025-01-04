import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/app/controllers/controller.dart';

class SettingsController extends Controller {
  final _supaBaseClient = Supabase.instance.client;

  Future<void> signOut() async {
    try {
      await _supaBaseClient.auth.signOut();
      await Auth.logout();
      routeToInitial();
    } catch (e) {
      throw Exception('Authentication failed');
    }
  }
}
