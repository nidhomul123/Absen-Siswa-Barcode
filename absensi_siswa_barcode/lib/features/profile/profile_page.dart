import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/data/models/admin_local_model.dart';
import 'package:absensi_siswa_barcode/data/models/settings_local_model.dart';
import 'package:absensi_siswa_barcode/features/auth/bloc/auth_bloc.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Box<SettingsLocal> settingsBox = Hive.box<SettingsLocal>('settings');
  Box<AdminLocal> adminBox = Hive.box<AdminLocal>('admin');

  final AuthBloc _authBloc = AuthBloc();

  @override
  void initState() {
    if (adminBox.isNotEmpty) {
      _usernameController.text = adminBox.values.first.username;
      _passwordController.text = adminBox.values.first.password;
    }
    _usernameController.addListener(() {
      if (adminBox.isNotEmpty) {
        // update
        adminBox.put(0,
          AdminLocal()
          ..username = _usernameController.text
          ..password = _passwordController.text
        );
      }
    });
    _passwordController.addListener(() {
      if (adminBox.isNotEmpty) {
        // update
        adminBox.put(0,
          AdminLocal()
          ..username = _usernameController.text
          ..password = _passwordController.text
        );
      }
    });
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
      title: Text('Settings', style: h1WhiteTextStyle),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.all(defaultMargin),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Username', style: h3BlackTextStyle),
              ),
              const SizedBox(height: 5),
              InputTextField(icon: Icons.person_outline_rounded, hint: '', controller: _usernameController, textInputType: TextInputType.text, textInputAction: TextInputAction.done),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Password', style: h3BlackTextStyle),
              ),
              const SizedBox(height: 5),
              InputPasswordField(icon: Icons.lock_outline_rounded, hint: '', controller: _passwordController, textInputType: TextInputType.text, textInputAction: TextInputAction.done),
              const SizedBox(height: 20),
              ValueListenableBuilder<Box<SettingsLocal>>(
                valueListenable: settingsBox.listenable(),
                builder: (context, box, _) {
                  DateTime? timeIn, timeOut;
                  if (box.isNotEmpty) {
                    timeIn = box.values.first.timeIn;
                    timeOut = box.values.first.timeOut;
                  }
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Jam Masuk', style: smallDarkGreyTextStyle),
                                  Text(datetimeToTime(timeIn), style: smallBlackTextStyle),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: timeIn != null ?
                                    TimeOfDay(hour: timeIn.hour, minute: timeIn.minute) :
                                    TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    DateTime now = DateTime.now();
                                    if (settingsBox.isEmpty) {
                                      // insert
                                      settingsBox.add(
                                        SettingsLocal()
                                        ..timeIn = DateTime(now.year, now.month, now.day, value.hour, value.minute)
                                        ..timeOut = null
                                      );
                                    } else {
                                      // update
                                      settingsBox.putAt(0,
                                        SettingsLocal()
                                        ..timeIn = DateTime(now.year, now.month, now.day, value.hour, value.minute)
                                        ..timeOut = timeOut
                                      );
                                    }
                                  }
                                });
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.more_vert_rounded)
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Jam Keluar', style: smallDarkGreyTextStyle),
                                  Text(datetimeToTime(timeOut), style: smallBlackTextStyle),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: timeOut != null ?
                                    TimeOfDay(hour: timeOut.hour, minute: timeOut.minute) :
                                    TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    DateTime now = DateTime.now();
                                    if (settingsBox.isEmpty) {
                                      // insert
                                      settingsBox.add(
                                        SettingsLocal()
                                        ..timeIn = null
                                        ..timeOut = DateTime(now.year, now.month, now.day, value.hour, value.minute)
                                      );
                                    } else {
                                      // update
                                      settingsBox.putAt(0,
                                        SettingsLocal()
                                        ..timeIn = timeIn
                                        ..timeOut = DateTime(now.year, now.month, now.day, value.hour, value.minute)
                                      );
                                    }
                                  }
                                });
                              },
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.more_vert_rounded)
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(height: 20),
              BlocProvider(
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
                    if (state is AuthLogoutResponse) {
                      if (state.status) {
                        Fluttertoast.showToast(
                          msg: 'Logout sukses',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2
                        );
                        context.goNamed('login');
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Logout gagal',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2
                        );
                      }
                    }
                  },
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _authBloc.add(LogoutEvent());
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kRed2Color),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          )
                        ),
                        elevation: MaterialStateProperty.all(0)
                      ),
                      child: Text('KELUAR', style: buttonWhiteTextStyle),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ],
    );
  }
}
