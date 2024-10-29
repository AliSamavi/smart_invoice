import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 1)
class SettingsModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String province;
  @HiveField(2)
  final String city;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final int phoneNum;
  @HiveField(5)
  final int postalCode;
  @HiveField(6)
  final int economicNum;

  SettingsModel({
    required this.name,
    required this.province,
    required this.city,
    required this.address,
    required this.phoneNum,
    required this.postalCode,
    required this.economicNum,
  });
}
