part of 'barcode_bloc.dart';

abstract class BarcodeEvent extends Equatable {
  const BarcodeEvent();

  @override
  List<Object> get props => [];
}

class ScanBarcodeEvent extends BarcodeEvent {
  final String qrCode;

  const ScanBarcodeEvent({
    required this.qrCode
  });

  @override
  List<Object> get props => [qrCode];
}
