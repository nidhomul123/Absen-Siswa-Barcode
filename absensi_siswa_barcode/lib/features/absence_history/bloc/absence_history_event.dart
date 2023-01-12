part of 'absence_history_bloc.dart';

abstract class AbsenceHistoryEvent extends Equatable {
  const AbsenceHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetAbsenceHistoryEvent extends AbsenceHistoryEvent {}
