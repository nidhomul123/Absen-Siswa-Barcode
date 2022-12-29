import 'package:absensi_siswa_barcode/akun_screen.dart';
import 'package:absensi_siswa_barcode/menuwidget.dart';
import 'package:absensi_siswa_barcode/absensidetail.dart';
import 'package:absensi_siswa_barcode/absensiitem.dart';
import 'package:absensi_siswa_barcode/home_page.dart';
import 'package:flutter/material.dart';
import 'models/absensi.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  
  final _pageOptions = [
    HomePage(),
    DetailAbsensiScreen(),
    AkunScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera_back_rounded,
              ),
              label: 'History Absensi'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Akun'),
        ],
        selectedItemColor: const Color(0xFF3D538F),
        unselectedItemColor: const Color(0xFF3D538F),
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}