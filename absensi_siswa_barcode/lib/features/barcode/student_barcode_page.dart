import 'package:flutter/material.dart';

class StudentBarcodePage extends StatefulWidget {
  const StudentBarcodePage({super.key});

  @override
  State<StudentBarcodePage> createState() => _StudentBarcodePageState();
}

class _StudentBarcodePageState extends State<StudentBarcodePage> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Student Barcode'),
    );
  }
}
