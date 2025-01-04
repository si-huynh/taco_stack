import 'package:flutter/foundation.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taco_stack_app/app/models/requests/sign_up_request.dart';

import '/app/controllers/controller.dart';

class AuthenticationController extends Controller {
  final _supaBaseClient = Supabase.instance.client;

  Future<String?> signUpWithEmail({
    required String email,
    required String password,
    data,
  }) async {
    try {
      final request = SignUpRequest.fromJson(data);
      final response = await _supaBaseClient.auth.signUp(
        email: request.email,
        password: request.password,
      );
      if (response.session != null) {
        request.id = response.user!.id;
        request.startDate = DateTime.now();
        await _supaBaseClient.from('users').insert(request.toJson());
        await Auth.authenticate(data: response.session!.toJson());
        return null;
      }
      return 'Something went wrong';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    }
  }

  Future<String?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supaBaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null) {
        await Auth.authenticate(data: response.session!.toJson());
        return null;
      }
      return 'Something went wrong';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    }
  }
}
