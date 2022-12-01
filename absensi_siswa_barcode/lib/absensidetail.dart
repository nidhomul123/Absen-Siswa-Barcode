import 'package:flutter/material.dart';

import '../models/absensi.dart';
import 'absensiitem.dart';
class DetailAbsensiScreen extends StatelessWidget {
  const DetailAbsensiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const Text(
                "Histori Absensi",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3D538F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AbsensiItem(
                Absensi: Attendances[index],
              );
            },
            itemCount: Attendances.length,
          ),
        ),
      ],
    );
  }
}