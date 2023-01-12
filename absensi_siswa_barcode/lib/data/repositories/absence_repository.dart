import 'package:absensi_siswa_barcode/data/datasources/local/absence_local_data_source.dart';
import 'package:absensi_siswa_barcode/data/models/absence_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AbsenceRepository {
  final absenceLocalDataSource = AbsenceLocalDataSource();

  Box<AbsenceLocal> getAbsenceHistory() {
    return absenceLocalDataSource.getAbsenceHistory();
  }
}
