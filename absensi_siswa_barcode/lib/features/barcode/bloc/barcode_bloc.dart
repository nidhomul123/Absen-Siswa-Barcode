import 'package:absensi_siswa_barcode/data/repositories/barcode_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final barcodeRepository = BarcodeRepository();

  BarcodeBloc() : super(BarcodeInitial()) {
    on<BarcodeEvent>((event, emit) {
    });

    on<ScanBarcodeEvent>((event, emit) async {
      try {
        emit(BarcodeScanLoading());
        final response = barcodeRepository.scanBarcode(event.qrCode);
          
        emit(BarcodeScanResponse(message: response));
      } catch (e) {
        debugPrint(e.toString());
        emit(BarcodeError(error: e.toString()));
      }
      emit(BarcodeInitial());
    });
  }
}
