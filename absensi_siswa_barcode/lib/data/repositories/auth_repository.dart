import 'package:absensi_siswa_barcode/data/datasources/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final authLocalDataSource = AuthLocalDataSource();
  
  Future<bool> login(String username, String password) async {
    final status = await authLocalDataSource.login(username, password);
    if (status) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('login_status', true);
    }
    return status;
  }

  Future<bool> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}