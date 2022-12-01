import 'package:absensi_siswa_barcode/akun_screen.dart';
import 'package:absensi_siswa_barcode/absensi_screen.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget tampilan;
  
  const MenuWidget({
    Key? key,
    required this.icon,
    required this.text, required this.tampilan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap:(){
          Navigator.push(context, MaterialPageRoute(builder:(context) => tampilan,
          ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 65,
              height: 65,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
