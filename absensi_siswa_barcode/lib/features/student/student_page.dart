import 'package:absensi_siswa_barcode/components/widget.dart';
import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/data/repositories/user_repository.dart';
import 'package:absensi_siswa_barcode/features/student/bloc/student_bloc.dart';
import 'package:absensi_siswa_barcode/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {

  final userRepository = UserRepository();

  final StudentBloc _studentBloc = StudentBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(),
      child: BlocListener<StudentBloc, StudentState>(
        listener: (context, state) {
          if (state is StudentError) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
            );
          }
        },
        child: Scaffold(
          appBar: appBar(),
          body: body(),
        ),
      )
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: kBlackColor,
      ),
      elevation: 0,
      backgroundColor: kWhiteColor,
      title: Text('Data Siswa', style: h2BlackTextStyle),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<StudentBloc, StudentState>(
            bloc: _studentBloc..add(GetStudentEvent()),
            builder: (context, state) {
              if (state is StudentResponse) {
                var studentList = state.students.values.toList().cast<UserLocal>();
                return RefreshIndicator(
                  onRefresh: () async => _studentBloc..add(GetStudentEvent()),
                  child: ListView(
                    children: state.students.values.map((e) {
                      return ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.studentClass),
                        onTap: () {
                          context.pushNamed('detail_student',
                            queryParams: {
                              'index': studentList.indexOf(e).toString(),
                              'qr_code': e.qrCode,
                              'username': e.username,
                              'password': e.password,
                              'name': e.name,
                              'student_class': e.studentClass,
                              'role': e.role
                            }
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(defaultMargin),
          child: NavigateButton(label: 'Tambah Siswa', route: 'add_student')
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
