import 'package:hive/hive.dart';

part 'absence_local_model.g.dart';

@HiveType(typeId: 1)
class AbsenceLocal extends HiveObject {
  @HiveField(0)
  late String qrCode;

  @HiveField(1)
  late DateTime? timeIn;

  @HiveField(2)
  late DateTime? timeOut;
}
