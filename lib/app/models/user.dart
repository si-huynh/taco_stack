import 'package:nylo_framework/nylo_framework.dart';

class User extends Model {
  User() : super(key: key);

  User.fromJson(data) {
    name = data['name'];
    email = data['email'];
  }
  String? name;
  String? email;

  static StorageKey key = 'user';

  @override
  Map<String, String?> toJson() => {'name': name, 'email': email};
}
