import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BkScreen extends StatefulWidget {
  const BkScreen({super.key});

  @override
  State<BkScreen> createState() => _BkScreenState();
}

class _BkScreenState extends State<BkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: const[ 
            Text ( " Selamat Datang !!!!")
          ],
        ),
      ),
    );
  }
}