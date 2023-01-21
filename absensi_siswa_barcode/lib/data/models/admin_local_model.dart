import 'package:hive/hive.dart';

part 'admin_local_model.g.dart';

@HiveType(typeId: 3)
class AdminLocal extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;
}
