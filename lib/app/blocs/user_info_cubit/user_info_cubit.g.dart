// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoStateImpl _$$UserInfoStateImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoStateImpl(
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserInfoStateImplToJson(_$UserInfoStateImpl instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
    };
