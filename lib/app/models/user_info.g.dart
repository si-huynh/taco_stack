// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      department: json['department'] as String,
      email: json['email'] as String,
      tacoCount: (json['taco_count'] as num).toInt(),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'start_date': instance.startDate.toIso8601String(),
      'department': instance.department,
      'taco_count': instance.tacoCount,
    };
