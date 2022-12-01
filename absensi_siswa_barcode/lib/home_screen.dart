import 'package:absensi_siswa_barcode/absensi_screen.dart';
import 'package:absensi_siswa_barcode/akun_screen.dart';
import 'package:absensi_siswa_barcode/bk_screen.dart';
import 'package:absensi_siswa_barcode/home_screen.dart';
import 'package:absensi_siswa_barcode/hospital_screen.dart';
import 'package:absensi_siswa_barcode/menuwidget.dart';
import 'package:absensi_siswa_barcode/scan_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 71, 220, 7),
              Color.fromARGB(153, 5, 227, 112),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Color.fromARGB(255, 7, 158, 234),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage('/img/21.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hallo,",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Nidhomul Muna Lana",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Stack(
                      children: const [
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Icon(
                            Icons.brightness_1,
                            size: 8.0,
                            color: Colors.redAccent,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Column(
                children: const [
                  Text(
                    "Absensi Scan Barcode",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MenuWidget(
                    icon: Icons.photo_camera_back_rounded,
                    text: "Scan Barcode", tampilan: ScanScreen(),
                  ),
                  MenuWidget(
                    icon: Icons.book_online_rounded,
                    text: "Absensi", tampilan: AbsensiScreen(),
                  ),
                  MenuWidget(
                    icon: Icons.bookmark_added,
                    text: "Bk sekolah", tampilan: BkScreen(),
                  ),
                  MenuWidget(
                    icon: Icons.local_hospital_rounded,
                    text: "Hospital sekolah", tampilan: HospitalScreen(),
                  ),
                 
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}