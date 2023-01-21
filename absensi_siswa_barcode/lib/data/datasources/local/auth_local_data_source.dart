import 'package:absensi_siswa_barcode/data/models/admin_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDataSource {

  Future<bool> login(String username, String password) async {
    var adminBox = Hive.box<AdminLocal>('admin');
    int count = adminBox.values.where((element) => element.username == username && element.password == password).length;
    if (count > 0) {
      return true;
    }
    return false;
  }
}