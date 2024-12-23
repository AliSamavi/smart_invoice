class Customer {
  late int? key;
  final String? name;
  final String? province;
  final String? city;
  final String? address;
  final String? phoneNum;
  final String? postalCode;
  final String? economicNum;
  final String? registrationNum;
  final String? nationalNum;
  final List<int>? invoicesKey;

  Customer({
    this.key,
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
