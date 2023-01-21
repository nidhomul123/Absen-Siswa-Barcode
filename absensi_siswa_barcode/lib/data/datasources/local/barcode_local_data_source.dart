import 'package:absensi_siswa_barcode/data/models/absence_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BarcodeLocalDataSource {

  String scanBarcode(String qrCode) {
    var absenceBox = Hive.box<AbsenceLocal>('absence');
    var userBox = Hive.box<UserLocal>('user');

    if (userBox.isNotEmpty) {
      bool status = userBox.values.where((element) => element.qrCode == qrCode).isNotEmpty;
      if (status) {
        List<AbsenceLocal> absenceList = absenceBox.values.where((element) => element.qrCode == qrCode).toList();

        if (absenceList.isEmpty) {
          // insert
          absenceBox.add(
            AbsenceLocal()
            ..qrCode = qrCode
            ..timeIn = DateTime.now()
            ..timeOut = null
          );
          debugPrint('===== Insert =====');
        } else {
          // update
          debugPrint('===== Update =====');
          var list = absenceBox.values.toList().cast<AbsenceLocal>();
          AbsenceLocal absence = absenceList.first;
          absenceBox.putAt(list.indexOf(absence),
            AbsenceLocal()
            ..qrCode = absence.qrCode
            ..timeIn = absence.timeIn
            ..timeOut = DateTime.now()
          );
        }
        return 'Berhasil Scan Barcode';
      } else {
        return 'QRCode Tidak Valid';
      }
    } else {
      return 'QRCode Tidak Valid';
    }
  }
}
