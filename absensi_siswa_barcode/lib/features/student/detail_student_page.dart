import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/domain/entities/user.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailStudentPage extends StatefulWidget {
  final int? index;
  final User student;

  const DetailStudentPage({
    required this.index,
    required this.student,
    super.key
  });

  @override
  State<DetailStudentPage> createState() => _DetailStudentPageState();
}

class _DetailStudentPageState extends State<DetailStudentPage> {

  String _qrCode = '';

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _classController = TextEditingController();

  @override
  void initState() {
    _qrCode = widget.student.qrCode;
    _usernameController.text = widget.student.username;
    _passwordController.text = widget.student.password;
    _nameController.text = widget.student.name;
    _classController.text = widget.student.studentClass;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      title: Text('Detail Akun Siswa', style: h1WhiteTextStyle),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: kBlackColor)
                    ),
                    child: QrImage(
                      data: _qrCode,
                      version: QrVersions.auto,
                      size: 150,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Username', style: h3BlackTextStyle),
                  ),
                  const SizedBox(height: 5),
                  InputTextField(icon: Icons.person_outline_rounded, hint: '', controller: _usernameController, textInputType: TextInputType.text, textInputAction: TextInputAction.next),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Password', style: h3BlackTextStyle),
                  ),
                  const SizedBox(height: 5),
                  InputPasswordField(icon: Icons.lock_outline_rounded, hint: '', controller: _passwordController, textInputType: TextInputType.text, textInputAction: TextInputAction.next),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Nama Lengkap', style: h3BlackTextStyle),
                  ),
                  const SizedBox(height: 5),
                  InputTextField(icon: Icons.short_text_rounded, hint: '', controller: _nameController, textInputType: TextInputType.text, textInputAction: TextInputAction.next),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Kelas', style: h3BlackTextStyle),
                  ),
                  const SizedBox(height: 5),
                  InputTextField(icon: Icons.short_text_rounded, hint: '', controller: _classController, textInputType: TextInputType.text, textInputAction: TextInputAction.done),
                  const SizedBox(height: 25),
                  SaveStudentButton(index: widget.index, qrCode: _qrCode, username: _usernameController, password: _passwordController, name: _nameController, studentClass: _classController),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
