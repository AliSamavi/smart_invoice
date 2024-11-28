import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final int discount;
  @HiveField(4)
  final int tax;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.tax,
  });
}
