import 'package:absensi_siswa_barcode/data/datasources/local/barcode_local_data_source.dart';

class BarcodeRepository {
  final barcodeLocalDataSource = BarcodeLocalDataSource();

  String scanBarcode(String qrCode) {
    return barcodeLocalDataSource.scanBarcode(qrCode);
  }
}
