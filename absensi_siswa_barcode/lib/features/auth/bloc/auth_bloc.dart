import 'package:absensi_siswa_barcode/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authRepository = AuthRepository();
  
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
    });

    on<LoginEvent>((event, emit) async {
      try {
        if (event.username.isEmpty || event.password.isEmpty) {
          emit(const AuthError(error: 'Username atau Password harus diisi'));
        } else {
          emit(AuthLoading());
          final response = await authRepository.login(event.username, event.password);
          
          emit(AuthLoginResponse(status: response));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(AuthError(error: e.toString()));
      }
      emit(AuthInitial());
    });

    on<LogoutEvent>((event, emit) async {
      try {
        final response = await authRepository.logout();
          
        emit(AuthLogoutResponse(status: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(AuthError(error: e.toString()));
      }
      emit(AuthInitial());
    });
  }
}
