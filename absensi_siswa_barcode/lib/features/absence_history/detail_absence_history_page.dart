import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';

class DetailAbsenceHistoryPage extends StatefulWidget {
  const DetailAbsenceHistoryPage({super.key});

  @override
  State<DetailAbsenceHistoryPage> createState() => _DetailAbsenceHistoryPageState();
}

class _DetailAbsenceHistoryPageState extends State<DetailAbsenceHistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('Daftar Riwayat', style: h1WhiteTextStyle),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.all(defaultMargin),
      children: const [
        StudentHistoryCard(
          name: 'M RODHI ARDIYANSYAH',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '07.30 WIB',
          status: TimeInStatus.late
        ),
        StudentHistoryCard(
          name: 'MUHAMMAD IBNU HAQ',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '06.45 WIB',
          status: TimeInStatus.notLate
        ),
        StudentHistoryCard(
          name: 'MUH. AKMAL',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '06.45 WIB',
          status: TimeInStatus.notLate
        ),
        StudentHistoryCard(
          name: 'KHAZIM FIKRI',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '06.45 WIB',
          status: TimeInStatus.notLate
        ),
        StudentHistoryCard(
          name: 'ANDRI FANKY KURNIAWAN',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '06.30 WIB',
          status: TimeInStatus.notLate
        ),
        StudentHistoryCard(
          name: 'ABDIL TEGAR ARIFIN',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '06.25 WIB',
          status: TimeInStatus.notLate
        ),
        StudentHistoryCard(
          name: 'ABDIL TEGAR ARIFIN',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '08.00 WIB',
          status: TimeInStatus.late
        ),
        StudentHistoryCard(
          name: 'ABDIL TEGAR ARIFIN',
          studentClass: 'MIPA 1 PUTRA',
          timeIn: '06.25 WIB',
          status: TimeInStatus.notLate
        ),
      ],
    );
  }
}
