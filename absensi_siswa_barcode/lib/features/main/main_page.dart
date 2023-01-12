import 'package:absensi_siswa_barcode/constants_old.dart';
import 'package:absensi_siswa_barcode/features/absence_history/absence_history_page.dart';
import 'package:absensi_siswa_barcode/features/barcode/scan_barcode_page.dart';
import 'package:absensi_siswa_barcode/features/barcode/student_barcode_page.dart';
import 'package:absensi_siswa_barcode/features/home/home_page.dart';
import 'package:absensi_siswa_barcode/features/profile/profile_page.dart';
import 'package:absensi_siswa_barcode/features/student/student_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedPage = 0;

  final _adminPageOptions = const [
    AbsenceHistoryPage(),
    ScanBarcodePage(),
    StudentPage(),
  ];

  final _studentPageOptions = const [
    HomePage(),
    StudentBarcodePage(),
    ProfilePage(),
  ];

  final _adminBottomNavBar = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Riwayat Absensi'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.photo_camera_back_rounded,
      ),
      label: 'Scan Barcode'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
      ),
      label: 'Data Siswa'
    ),
  ];

  final _studentBottomNavBar = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Beranda'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.photo_camera_back_rounded,
      ),
      label: 'Barcode'
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
      ),
      label: 'Akun'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _adminPageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: _adminBottomNavBar,
        currentIndex: _selectedPage,
        selectedItemColor: mainColor,
        unselectedItemColor: const Color(0xFF3D538F),
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
