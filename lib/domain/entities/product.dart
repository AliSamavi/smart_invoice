class Product {
  late int? key;
  late int id;
  late String name;
  late int price;
  late int discount;
  late int tax;

  Product({
    this.key,
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.tax,
  });
}
