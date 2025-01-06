part of 'app_settings_cubit.dart';

@freezed
class AppSettingsState with _$AppSettingsState {
  const factory AppSettingsState({
    required String localeName,
    required int userAvatarAsset,
  }) = _AppSettingsState;

  factory AppSettingsState.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsStateFromJson(json);
}
