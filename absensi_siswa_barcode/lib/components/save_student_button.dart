import 'package:absensi_siswa_barcode/data/repositories/user_repository.dart';
import 'package:absensi_siswa_barcode/domain/entities/user.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SaveStudentButton extends StatefulWidget {
  final int? index;
  final String qrCode;
  final TextEditingController username;
  final TextEditingController password;
  final TextEditingController name;
  final TextEditingController studentClass;

  const SaveStudentButton({
    required this.index,
    required this.qrCode,
    required this.username,
    required this.password,
    required this.name,
    required this.studentClass,
    super.key
  });

  @override
  State<SaveStudentButton> createState() => _SaveStudentButtonState();
}

class _SaveStudentButtonState extends State<SaveStudentButton> {
  
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          userRepository.create(
            widget.index,
            User(
              qrCode: widget.qrCode,
              username: widget.username.text,
              password: widget.password.text,
              name: widget.name.text,
              studentClass: widget.studentClass.text,
              role: 'siswa'
            )
          );
          context.pop();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            )
          ),
          elevation: MaterialStateProperty.all(0)
        ),
        child: Text('SIMPAN', style: buttonWhiteTextStyle),
        // child: (state is AuthLoading)
        //   ? const SizedBox(
        //     height: 30,
        //     width: 30,
        //     child: CircularProgressIndicator(color: kWhiteColor),
        //   )
        // : Text('SIMPAN', style: buttonWhiteTextStyle),
      ),
    );
  }
}
