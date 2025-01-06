// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsStateImpl _$$AppSettingsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsStateImpl(
      localeName: json['localeName'] as String,
      userAvatarAsset: (json['userAvatarAsset'] as num).toInt(),
    );

Map<String, dynamic> _$$AppSettingsStateImplToJson(
        _$AppSettingsStateImpl instance) =>
    <String, dynamic>{
      'localeName': instance.localeName,
      'userAvatarAsset': instance.userAvatarAsset,
    };
