import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/data/models/settings_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/features/absence_history/bloc/absence_history_bloc.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class AbsenceHistoryPage extends StatefulWidget {
  const AbsenceHistoryPage({super.key});

  @override
  State<AbsenceHistoryPage> createState() => _AbsenceHistoryPageState();
}

class _AbsenceHistoryPageState extends State<AbsenceHistoryPage> {

  Box<SettingsLocal> settingsBox = Hive.box<SettingsLocal>('settings');

  final AbsenceHistoryBloc _absenceHistoryBloc = AbsenceHistoryBloc();

  DateTime? timeIn, timeOut;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text('ABSENSI ONLINE', style: h1WhiteTextStyle),
      actions: [
        IconButton(
          onPressed: () {
            context.pushNamed('profile');
          },
          icon: const Icon(Icons.person_rounded)
        ),
      ],
    );
  }

  Widget body() {
    return RefreshIndicator(
      onRefresh: () async => _absenceHistoryBloc..add(GetAbsenceHistoryEvent()),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 80,
              color: kBlueColor,
            ),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: kDarkGreyColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(DateFormat("EEEE","id_ID").format(DateTime.now()), style: h1WhiteTextStyle),
                            Text(DateFormat("d MMMM yyyy","id_ID").format(DateTime.now()), style: regularWhiteTextStyle),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(defaultMargin),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Detail Jam', style: h3BlackTextStyle),
                          ),
                          const SizedBox(height: 5),
                          ValueListenableBuilder<Box<SettingsLocal>>(
                            valueListenable: settingsBox.listenable(),
                            builder: (context, box, _) {
                              if (box.isNotEmpty) {
                                timeIn = box.values.first.timeIn;
                                timeOut = box.values.first.timeOut;
                              }
    
                              return Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: kRedColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('KELUAR', style: h1WhiteTextStyle),
                                            Text(datetimeToTime(timeOut), style: regularWhiteTextStyle),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: kGreenColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text('MASUK', style: h1WhiteTextStyle),
                                            Text(datetimeToTime(timeIn), style: regularWhiteTextStyle),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              );
                            }
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text('Detail Riwayat', style: h3BlackTextStyle),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  context.pushNamed('detail_absence_history');
                                },
                                child: Text('Lihat Detail', style: regularBlackTextStyle),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          BlocBuilder<AbsenceHistoryBloc, AbsenceHistoryState>(
                            bloc: _absenceHistoryBloc..add(GetAbsenceHistoryEvent()),
                            builder: (context, state) {
                              if (state is AbsenceHistoryResponse) {
                                return Column(
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
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          ),
                          // const StudentHistoryCard(
                          //   name: 'M RODHI ARDIYANSYAH',
                          //   studentClass: 'MIPA 1 PUTRA',
                          //   timeIn: '07.30 WIB',
                          //   status: TimeInStatus.late
                          // ),
                          // const StudentHistoryCard(
                          //   name: 'MUHAMMAD IBNU HAQ',
                          //   studentClass: 'MIPA 1 PUTRA',
                          //   timeIn: '06.45 WIB',
                          //   status: TimeInStatus.notLate
                          // ),
                          // const StudentHistoryCard(
                          //   name: 'MUH. AKMAL',
                          //   studentClass: 'MIPA 1 PUTRA',
                          //   timeIn: '06.45 WIB',
                          //   status: TimeInStatus.notLate
                          // ),
                          // const StudentHistoryCard(
                          //   name: 'KHAZIM FIKRI',
                          //   studentClass: 'MIPA 1 PUTRA',
                          //   timeIn: '06.45 WIB',
                          //   status: TimeInStatus.notLate
                          // ),
                          // const StudentHistoryCard(
                          //   name: 'ANDRI FANKY KURNIAWAN',
                          //   studentClass: 'MIPA 1 PUTRA',
                          //   timeIn: '06.30 WIB',
                          //   status: TimeInStatus.notLate
                          // ),
                          // const StudentHistoryCard(
                          //   name: 'ABDIL TEGAR ARIFIN',
                          //   studentClass: 'MIPA 1 PUTRA',
                          //   timeIn: '06.25 WIB',
                          //   status: TimeInStatus.notLate
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
