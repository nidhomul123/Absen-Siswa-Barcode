part of 'absence_history_bloc.dart';

abstract class AbsenceHistoryState extends Equatable {
  const AbsenceHistoryState();
  
  @override
  List<Object> get props => [];
}

class AbsenceHistoryInitial extends AbsenceHistoryState {}

class AbsenceHistoryLoading extends AbsenceHistoryState {}

class AbsenceHistoryResponse extends AbsenceHistoryState {
  final Box<AbsenceLocal> studentAbsence;

  const AbsenceHistoryResponse({
    required this.studentAbsence
  });

  @override
  List<Object> get props => [studentAbsence];
}

class AbsenceHistoryError extends AbsenceHistoryState {
  final String error;

  const AbsenceHistoryError({
    required this.error
  });

  @override
  List<Object> get props => [error];
}
