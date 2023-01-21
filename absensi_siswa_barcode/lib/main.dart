import 'package:absensi_siswa_barcode/data/models/admin_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/settings_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/absence_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting('id', null);

  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(AdminLocalAdapter());
  Hive.registerAdapter(UserLocalAdapter());
  Hive.registerAdapter(AbsenceLocalAdapter());
  Hive.registerAdapter(SettingsLocalAdapter());
  // Opening the box
  await Hive.openBox<AdminLocal>('admin');
  await Hive.openBox<UserLocal>('user');
  await Hive.openBox<AbsenceLocal>('absence');
  await Hive.openBox<SettingsLocal>('settings');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Absensi Siswa Scan Barcode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Home(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

