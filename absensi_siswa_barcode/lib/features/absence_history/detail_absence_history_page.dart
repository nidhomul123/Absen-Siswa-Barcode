import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/data/models/settings_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/features/absence_history/bloc/absence_history_bloc.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DetailAbsenceHistoryPage extends StatefulWidget {
  const DetailAbsenceHistoryPage({super.key});

  @override
  State<DetailAbsenceHistoryPage> createState() => _DetailAbsenceHistoryPageState();
}

class _DetailAbsenceHistoryPageState extends State<DetailAbsenceHistoryPage> {

  Box<SettingsLocal> settingsBox = Hive.box<SettingsLocal>('settings');

  final AbsenceHistoryBloc _absenceHistoryBloc = AbsenceHistoryBloc();

  DateTime? timeIn, timeOut;

  @override
  void initState() {
    if (settingsBox.isNotEmpty) {
      timeIn = settingsBox.values.first.timeIn;
      timeOut = settingsBox.values.first.timeOut;
    }
    super.initState();
  }

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
    return BlocBuilder<AbsenceHistoryBloc, AbsenceHistoryState>(
      bloc: _absenceHistoryBloc..add(GetAbsenceHistoryEvent()),
      builder: (context, state) {
        if (state is AbsenceHistoryResponse) {
          return RefreshIndicator(
            onRefresh: () async => _absenceHistoryBloc..add(GetAbsenceHistoryEvent()),
            child: ListView(
              padding: const EdgeInsets.all(defaultMargin),
              children: state.studentAbsence.values.map((e) {
                Box<UserLocal> userBox = Hive.box<UserLocal>('user');
                var studentList = userBox.values.toList().cast<UserLocal>();
                List<UserLocal> student = studentList.where((element) => element.qrCode == e.qrCode).toList();

                String name = '-';
                String studentClass = '-';
                if (student.isNotEmpty) {
                  name = student.first.name;
                  studentClass = student.first.studentClass;
                }

                return StudentHistoryCard(
                  name: name,
                  studentClass: studentClass,
                  timeIn: datetimeToTime(e.timeIn),
                  status: (e.timeIn == null || timeIn == null) ?
                    TimeInStatus.nothing :
                    (e.timeIn!.isAfter(timeIn!) ? TimeInStatus.late : TimeInStatus.notLate)
                );
              }).toList(),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
    // return ListView(
    //   padding: const EdgeInsets.all(defaultMargin),
    //   children: const [
    //     StudentHistoryCard(
    //       name: 'M RODHI ARDIYANSYAH',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '07.30 WIB',
    //       status: TimeInStatus.late
    //     ),
    //     StudentHistoryCard(
    //       name: 'MUHAMMAD IBNU HAQ',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '06.45 WIB',
    //       status: TimeInStatus.notLate
    //     ),
    //     StudentHistoryCard(
    //       name: 'MUH. AKMAL',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '06.45 WIB',
    //       status: TimeInStatus.notLate
    //     ),
    //     StudentHistoryCard(
    //       name: 'KHAZIM FIKRI',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '06.45 WIB',
    //       status: TimeInStatus.notLate
    //     ),
    //     StudentHistoryCard(
    //       name: 'ANDRI FANKY KURNIAWAN',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '06.30 WIB',
    //       status: TimeInStatus.notLate
    //     ),
    //     StudentHistoryCard(
    //       name: 'ABDIL TEGAR ARIFIN',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '06.25 WIB',
    //       status: TimeInStatus.notLate
    //     ),
    //     StudentHistoryCard(
    //       name: 'ABDIL TEGAR ARIFIN',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '08.00 WIB',
    //       status: TimeInStatus.late
    //     ),
    //     StudentHistoryCard(
    //       name: 'ABDIL TEGAR ARIFIN',
    //       studentClass: 'MIPA 1 PUTRA',
    //       timeIn: '06.25 WIB',
    //       status: TimeInStatus.notLate
    //     ),
    //   ],
    // );
  }
}
