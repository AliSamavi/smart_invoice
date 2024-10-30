import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 1)
class SettingsModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? province;
  @HiveField(2)
  final String? city;
  @HiveField(3)
  final String? address;
  @HiveField(4)
  final int? phoneNum;
  @HiveField(5)
  final int? postalCode;
  @HiveField(6)
  final int? economicNum;

  SettingsModel({
    this.name,
    this.province,
    this.city,
    this.address,
    this.phoneNum,
    this.postalCode,
    this.economicNum,
  });
}
