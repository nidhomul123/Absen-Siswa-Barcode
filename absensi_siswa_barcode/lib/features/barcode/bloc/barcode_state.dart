part of 'barcode_bloc.dart';

abstract class BarcodeState extends Equatable {
  const BarcodeState();
  
  @override
  List<Object> get props => [];
}

class BarcodeInitial extends BarcodeState {}

class BarcodeScanLoading extends BarcodeState {}

class BarcodeScanResponse extends BarcodeState {
  final String message;

  const BarcodeScanResponse({
    required this.message
  });

  @override
  List<Object> get props => [message];
}

class BarcodeError extends BarcodeState {
  final String error;

  const BarcodeError({
    required this.error
  });

  @override
  List<Object> get props => [error];
}
