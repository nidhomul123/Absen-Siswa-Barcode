import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings_local_model.g.dart';

@HiveType(typeId: 2)
class SettingsLocal extends HiveObject {
  @HiveField(0)
  late DateTime? timeIn;

  @HiveField(1)
  late DateTime? timeOut;
}
