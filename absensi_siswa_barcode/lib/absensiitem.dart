import 'package:absensi_siswa_barcode/models/absensi.dart';
import 'package:flutter/material.dart';

import 'models/absensi.dart';

class AbsensiItem extends StatelessWidget {
  final Absensi;
  const AbsensiItem({
    Key? key,
    required this.Absensi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF3D538F),
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 132, 187, 232),
                borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: 35,
              height: 35,
              child: Center(
                child: Text(
                  Absensi.to
                      .split(" ")
                      .map((e) => e.substring(0, 1))
                      .toList()
                      .join(),
                  style: const TextStyle(
                    color: Color(0xFF3D538F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Image.network(
              //   this.image,
              // ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    Absensi.to,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF3D538F),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  Absensi.amount,
                  style:
                      const TextStyle(color: Color(0xFF3D538F), fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  Absensi.date,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFA6D6D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                Absensi.des,
                style: const TextStyle(color: Color(0xFF3D538F), fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  Absensi.description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFA6D6D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
