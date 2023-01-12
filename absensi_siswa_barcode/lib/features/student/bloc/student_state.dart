part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();
  
  @override
  List<Object> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentResponse extends StudentState {
  final Box<UserLocal> students;

  const StudentResponse({
    required this.students
  });

  @override
  List<Object> get props => [students];
}

class StudentError extends StudentState {
  final String error;

  const StudentError({
    required this.error
  });

  @override
  List<Object> get props => [error];
}
