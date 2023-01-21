import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';

enum TimeInStatus {
  late,
  notLate,
  nothing
}

class StudentHistoryCard extends StatelessWidget {
  final String name;
  final String studentClass;
  final String timeIn;
  final TimeInStatus status;

  const StudentHistoryCard({
    required this.name,
    required this.studentClass,
    required this.timeIn,
    required this.status,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.person_rounded, size: 40),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(name, style: regularBlueTextStyle)
                ),
                Text(studentClass, style: regularBlackTextStyle),
                Text('MASUK : $timeIn', style: regularBlackTextStyle),
                status == TimeInStatus.late ?
                Text('TERLAMBAT', style: regularRedTextStyle) :
                (
                  status == TimeInStatus.notLate ?
                  Text('TIDAK TERLAMBAT', style: regularGreenTextStyle) :
                  const Text('-')
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
