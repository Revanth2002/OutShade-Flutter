import 'package:hive/hive.dart';

part 'auth_adapter.g.dart';

@HiveType(typeId: 1)
class Auth {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String gender;
  @HiveField(3)
  String id;
  @HiveField(4)
  bool login;

  Auth({required this.name, required this.age, required this.gender, required this.id, required this.login});
}