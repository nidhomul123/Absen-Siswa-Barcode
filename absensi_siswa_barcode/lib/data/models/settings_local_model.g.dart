// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsLocalAdapter extends TypeAdapter<SettingsLocal> {
  @override
  final int typeId = 2;

  @override
  SettingsLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsLocal()
      ..timeIn = fields[0] as DateTime?
      ..timeOut = fields[1] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, SettingsLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timeIn)
      ..writeByte(1)
      ..write(obj.timeOut);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
