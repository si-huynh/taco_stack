part of 'user_info_cubit.dart';

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    @Default(null) UserInfo? userInfo,
  }) = _UserInfoState;

  factory UserInfoState.fromJson(Map<String, dynamic> json) =>
      _$UserInfoStateFromJson(json);
}
