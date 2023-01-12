import 'package:hive/hive.dart';

part 'user_local_model.g.dart';

@HiveType(typeId: 0)
class UserLocal extends HiveObject {
  @HiveField(0)
  late String qrCode;

  @HiveField(1)
  late String username;

  @HiveField(2)
  late String password;

  @HiveField(3)
  late String name;

  @HiveField(4)
  late String studentClass;

  @HiveField(5)
  late String role;
}
