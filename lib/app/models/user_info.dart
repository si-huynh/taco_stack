import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.startDate,
    required this.department,
    required this.email,
    required this.tacoCount,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  final String id;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  final String department;
  @JsonKey(name: 'taco_count')
  final int tacoCount;

  String get fullName => '$firstName $lastName';
}
