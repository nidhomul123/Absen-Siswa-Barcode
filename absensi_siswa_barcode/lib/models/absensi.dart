class Attendance {
  final int id;
  final String to;
  final String amount;
  final String date;
  final String des;
  final String description;

  Attendance(
    this.id,
    this.to,
    this.amount,
    this.date,
    this.des,
    this.description,
  );
}

final List<Attendance> Attendances = [
  Attendance(
    1,
    'MUHAMMAD BAHRUL ALAWI',
    'PAGI HARI',
    'MASUK',
    '30 Juli 2022 06:13',
    'TIDAK TERLAMBAT',
  ),
  Attendance(
    2,
    'ABDIS SLAMET',
    'SIANG HARI',
    'KELUAR',
    '12 Juli 2022 15:00',
    'TEPAT WAKTU',
  ),
  Attendance(
    3,
    'DARWATI',
    'PAGI HARI',
    'MASUK',
    '13 Juli 2022 07:13',
    'TERLAMBAT',
  ),
  Attendance(
    4,
    'AHMAD YAZID S',
    'SORE HARI',
    'KELUAR',
    '10 Juli 2022 15:30',
    'TEPAT WAKTU',
  ),
  Attendance(
    5,
    'FAIRUZ ZAM-ZAMI',
    'PAGI HARI',
    'MASUK',
    '20 Juli 2022 16:00',
    'TERLAMBAT',
  ),
  Attendance(
    6,
    'FAHMI ALADIN',
    'SIANG HARI',
    'KELUAR',
    '23 Juli 2022 14:15',
    'TEPAT WAKTU',
  ),
  Attendance(
    7,
    'SULTHON BANDAR',
    'PAGI HARI',
    'MASUK',
    '4 Juli 2022 08:15',
    'TERLAMBAT',
  ),
  Attendance(
    8,
    'AL HIKMAH',
    'SIANG HARI',
    'KELUAR',
    '12 Juli 2022 13:15',
    'TEPAT WAKTU',
  ),

];
