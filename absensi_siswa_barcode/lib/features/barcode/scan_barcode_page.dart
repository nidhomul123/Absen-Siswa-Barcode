import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';

class ScanBarcodePage extends StatefulWidget {
  const ScanBarcodePage({super.key});

  @override
  State<ScanBarcodePage> createState() => _ScanBarcodePageState();
}

class _ScanBarcodePageState extends State<ScanBarcodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: kBlackColor,
      ),
      elevation: 0,
      backgroundColor: kWhiteColor,
      title: Text('Scan Barcode', style: h2BlackTextStyle),
    );
  }
}
