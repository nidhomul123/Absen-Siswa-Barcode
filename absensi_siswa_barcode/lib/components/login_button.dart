import 'package:absensi_siswa_barcode/features/auth/bloc/auth_bloc.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController username;
  final TextEditingController password;

  const LoginButton({
    required this.username,
    required this.password,
    super.key
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
            );
          }
          if (state is AuthLoginResponse) {
            if (state.status) {
              Fluttertoast.showToast(
                msg: 'Login sukses',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2
              );
              context.goNamed('main');
            } else {
              Fluttertoast.showToast(
                msg: 'Login gagal',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2
              );
            }
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: _authBloc,
          builder: (context, state) {
            return SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _authBloc.add(LoginEvent(username: widget.username.text, password: widget.password.text));
                  // context.goNamed('main');
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
                // child: Text('MASUK', style: buttonWhiteTextStyle),
                child: (state is AuthLoading)
                  ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(color: kWhiteColor),
                  )
                : Text('MASUK', style: buttonWhiteTextStyle),
              ),
            );
          }
        ),
      )
    );
  }
}
