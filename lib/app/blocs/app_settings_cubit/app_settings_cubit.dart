import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_settings_cubit.freezed.dart';
part 'app_settings_cubit.g.dart';
part 'app_settings_state.dart';

class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  AppSettingsCubit({required String localeName})
      : super(
          AppSettingsState(
            localeName: localeName,
            userAvatarAsset: 4,
          ),
        );

  void setLocale(String value) {
    emit(state.copyWith(localeName: value));
  }

  void changeUserAvatar(int value) {
    emit(state.copyWith(userAvatarAsset: value));
  }

  @override
  AppSettingsState? fromJson(Map<String, dynamic> json) {
    return AppSettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppSettingsState state) {
    return state.toJson();
  }
}
