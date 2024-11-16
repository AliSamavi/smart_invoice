// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 1;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      name: fields[0] as String?,
      province: fields[1] as String?,
      city: fields[2] as String?,
      address: fields[3] as String?,
      phoneNum: fields[4] as String?,
      postalCode: fields[5] as String?,
      economicNum: fields[6] as String?,
      registrationNum: fields[7] as String?,
      nationalNum: fields[8] as String?,
      stamp: fields[9] as String?,
      signature: fields[10] as String?,
      logo: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.province)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.phoneNum)
      ..writeByte(5)
      ..write(obj.postalCode)
      ..writeByte(6)
      ..write(obj.economicNum)
      ..writeByte(7)
      ..write(obj.registrationNum)
      ..writeByte(8)
      ..write(obj.nationalNum)
      ..writeByte(9)
      ..write(obj.stamp)
      ..writeByte(10)
      ..write(obj.signature)
      ..writeByte(11)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
