import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController username;
  final TextEditingController password;

  const LoginButton({
    required this.username,
    required this.password,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.goNamed('main');
          // context.read<AuthBloc>().add(LoginEvent(
          //   login: Login(email: username.text, password: password.text)
          // ));
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            )
          ),
          elevation: MaterialStateProperty.all(0)
        ),
        child: Text('MASUK', style: buttonWhiteTextStyle),
        // child: (state is AuthLoading)
        //   ? const SizedBox(
        //     height: 30,
        //     width: 30,
        //     child: CircularProgressIndicator(color: kWhiteColor),
        //   )
        // : Text('MASUK', style: buttonWhiteTextStyle),
      ),
    );
  }
}
