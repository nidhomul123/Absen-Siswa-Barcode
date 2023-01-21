// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdminLocalAdapter extends TypeAdapter<AdminLocal> {
  @override
  final int typeId = 3;

  @override
  AdminLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdminLocal()
      ..username = fields[0] as String
      ..password = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, AdminLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
