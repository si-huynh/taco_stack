import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taco_stack_app/app/models/user_info.dart';

part 'user_info_cubit.freezed.dart';
part 'user_info_cubit.g.dart';
part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoState());

  final _supaBaseClient = Supabase.instance.client;

  Future<void> loadUserInfo() async {
    try {
      final sessionUser = Session.fromJson(Auth.data())?.user;
      final response = await _supaBaseClient.from('users').select().eq(
            'email',
            sessionUser!.email!,
          );
      final userInfo = UserInfo.fromJson(response.first);
      emit(state.copyWith(userInfo: userInfo));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> calculateTaco(int count) async {
    try {
      final userId = state.userInfo!.id;
      final tacoCount = state.userInfo!.tacoCount + count;
      final response = await _supaBaseClient
          .from('users')
          .update({'taco_count': tacoCount})
          .eq('id', userId)
          .select();
      emit(state.copyWith(userInfo: UserInfo.fromJson(response.first)));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
