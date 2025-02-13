import 'package:nylo_framework/nylo_framework.dart';

class GithubInfo extends Model {
  GithubInfo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.isPrivate,
  });

  factory GithubInfo.fromJson(Map<String, dynamic> json) {
    return GithubInfo(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      isPrivate: json['private'],
    );
  }

  final num id;
  final String name;
  final String fullName;
  final bool isPrivate;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'private': isPrivate,
    };
  }
}
