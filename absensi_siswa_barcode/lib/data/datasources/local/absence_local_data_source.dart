import 'package:absensi_siswa_barcode/data/models/absence_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AbsenceLocalDataSource {

  Box<AbsenceLocal> getAbsenceHistory() {
    return Hive.box<AbsenceLocal>('absence');
  }
}
