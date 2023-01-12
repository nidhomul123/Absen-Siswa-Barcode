import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const InputTextField({
    required this.icon,
    required this.hint,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(35),
        ),
        filled: true,
        hintText: hint,
        hintStyle: inputHintGreyTextStyle,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(icon),
        ),
      ),
      controller: controller,
      style: inputBlackTextStyle,
      keyboardType: textInputType,
      maxLines: null,
      textInputAction: textInputAction
    );
  }
}
