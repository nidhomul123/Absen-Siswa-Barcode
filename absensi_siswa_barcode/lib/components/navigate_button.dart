import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigateButton extends StatelessWidget {
  final String label;
  final String route;

  const NavigateButton({
    required this.label,
    required this.route,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.pushNamed(route);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            )
          ),
          elevation: MaterialStateProperty.all(0)
        ),
        child: Text(label, style: buttonWhiteTextStyle),
      ),
    );
  }
}
