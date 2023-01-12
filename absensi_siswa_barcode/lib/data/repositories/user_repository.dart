import 'package:absensi_siswa_barcode/data/datasources/local/user_local_data_source.dart';
import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/domain/entities/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  final userLocalDataSource = UserLocalDataSource();

  Box<UserLocal> getStudents() {
    return userLocalDataSource.getStudents();
  }

  Future create(int? index, User user) async {
    return await userLocalDataSource.create(index, user);
  }
}
