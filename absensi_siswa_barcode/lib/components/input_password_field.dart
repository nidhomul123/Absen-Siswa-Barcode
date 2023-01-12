import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';

class InputPasswordField extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const InputPasswordField({
    required this.icon,
    required this.hint,
    required this.controller,
    required this.textInputType,
    required this.textInputAction,
    super.key
  });

  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
  }

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
        hintText: widget.hint,
        hintStyle: inputHintGreyTextStyle,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(widget.icon),
        ),
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 5),
          onPressed: () {
            setState(() => _obscurePassword = !_obscurePassword );
          },
          icon: Icon(_obscurePassword ? Icons.visibility_off_rounded : Icons.visibility_rounded)
        ),
      ),
      controller: widget.controller,
      obscureText: _obscurePassword,
      style: inputBlackTextStyle,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction
    );
  }
}
