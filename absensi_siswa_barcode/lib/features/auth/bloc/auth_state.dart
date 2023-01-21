part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginResponse extends AuthState {
  final bool status;

  const AuthLoginResponse({
    required this.status
  });

  @override
  List<Object> get props => [status];
}

class AuthLogoutResponse extends AuthState {
  final bool status;

  const AuthLogoutResponse({
    required this.status
  });

  @override
  List<Object> get props => [status];
}

class AuthError extends AuthState {
  final String error;

  const AuthError({
    required this.error
  });

  @override
  List<Object> get props => [error];
}
