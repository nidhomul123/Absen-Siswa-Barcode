import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/domain/entities/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserLocalDataSource {

  Box<UserLocal> getStudents() {
    return Hive.box<UserLocal>('user');
  }

  Future create(int? index, User user) async {
    var userBox = Hive.box<UserLocal>('user');
    if (index == null) {
      // insert
      userBox.add(
        UserLocal()
        ..qrCode = user.qrCode
        ..username = user.username
        ..password = user.password
        ..name = user.name
        ..studentClass = user.studentClass
        ..role = user.role
      );
    } else {
      // update
      userBox.putAt(index,
        UserLocal()
        ..qrCode = user.qrCode
        ..username = user.username
        ..password = user.password
        ..name = user.name
        ..studentClass = user.studentClass
        ..role = user.role
      );
    }
  }
}
