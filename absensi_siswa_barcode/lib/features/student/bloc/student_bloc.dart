import 'package:absensi_siswa_barcode/data/models/user_local_model.dart';
import 'package:absensi_siswa_barcode/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final userRepository = UserRepository();

  StudentBloc() : super(StudentInitial()) {
    on<StudentEvent>((event, emit) {
    });

    on<GetStudentEvent>((event, emit) async {
      try {
        emit(StudentLoading());
        final response = userRepository.getStudents();
          
        emit(StudentResponse(students: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(StudentError(error: e.toString()));
      }
    });
  }
}
