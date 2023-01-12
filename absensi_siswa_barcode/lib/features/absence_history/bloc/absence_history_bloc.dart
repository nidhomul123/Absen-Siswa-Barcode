import 'package:absensi_siswa_barcode/data/models/absence_local_model.dart';
import 'package:absensi_siswa_barcode/data/repositories/absence_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'absence_history_event.dart';
part 'absence_history_state.dart';

class AbsenceHistoryBloc extends Bloc<AbsenceHistoryEvent, AbsenceHistoryState> {
  final absenceRepository = AbsenceRepository();

  AbsenceHistoryBloc() : super(AbsenceHistoryInitial()) {
    on<AbsenceHistoryEvent>((event, emit) {
    });

    on<GetAbsenceHistoryEvent>((event, emit) async {
      try {
        emit(AbsenceHistoryLoading());
        final response = absenceRepository.getAbsenceHistory();
          
        emit(AbsenceHistoryResponse(studentAbsence: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(AbsenceHistoryError(error: e.toString()));
      }
    });
  }
}
