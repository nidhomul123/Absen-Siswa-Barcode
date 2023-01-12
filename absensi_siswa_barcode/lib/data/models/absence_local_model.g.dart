// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbsenceLocalAdapter extends TypeAdapter<AbsenceLocal> {
  @override
  final int typeId = 1;

  @override
  AbsenceLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbsenceLocal()
      ..qrCode = fields[0] as String
      ..timeIn = fields[1] as DateTime
      ..timeOut = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, AbsenceLocal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.qrCode)
      ..writeByte(1)
      ..write(obj.timeIn)
      ..writeByte(2)
      ..write(obj.timeOut);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbsenceLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
