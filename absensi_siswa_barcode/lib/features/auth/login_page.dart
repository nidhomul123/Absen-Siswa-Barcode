import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/data/models/admin_local_model.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  var adminBox = Hive.box<AdminLocal>('admin');

  @override
  void initState() {
    List<AdminLocal> adminList = adminBox.values.toList();
    if (adminList.isEmpty) {
      // insert
      adminBox.add(
        AdminLocal()
        ..username = 'admin'
        ..password = '12345678'
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 30),
              Text('Login', style: bigBlackTextStyle),
              const SizedBox(height: 30),
              SvgPicture.asset('assets/icons/login.svg'),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Username', style: h3BlackTextStyle),
                    ),
                    const SizedBox(height: 5),
                    InputTextField(icon: Icons.person_outline_rounded, hint: 'Masukkan username', controller: _usernameController, textInputType: TextInputType.text, textInputAction: TextInputAction.next),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Password', style: h3BlackTextStyle),
                    ),
                    const SizedBox(height: 5),
                    InputPasswordField(icon: Icons.lock_outline_rounded, hint: 'Masukkan password', controller: _passwordController, textInputType: TextInputType.text, textInputAction: TextInputAction.done),
                    const SizedBox(height: 25),
                    LoginButton(username: _usernameController, password: _passwordController),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
