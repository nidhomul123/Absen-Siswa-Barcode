// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocalAdapter extends TypeAdapter<UserLocal> {
  @override
  final int typeId = 0;

  @override
  UserLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocal()
      ..qrCode = fields[0] as String
      ..username = fields[1] as String
      ..password = fields[2] as String
      ..name = fields[3] as String
      ..studentClass = fields[4] as String
      ..role = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, UserLocal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.qrCode)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.studentClass)
      ..writeByte(5)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
