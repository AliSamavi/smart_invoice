import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 2)
class CustomerModel extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? province;
  @HiveField(2)
  final String? city;
  @HiveField(3)
  final String? address;
  @HiveField(4)
  final String? phoneNum;
  @HiveField(5)
  final String? postalCode;
  @HiveField(6)
  final String? economicNum;
  @HiveField(7)
  final String? registrationNum;
  @HiveField(8)
  final String? nationalNum;
  @HiveField(9)
  final List<int>? invoicesKey;

  CustomerModel({
    this.name,
    this.province,
    this.city,
    this.address,
    this.phoneNum,
    this.postalCode,
    this.economicNum,
    this.registrationNum,
    this.nationalNum,
    this.invoicesKey,
  });
}
