import 'package:hive/hive.dart';

part 'local_storage_model.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  Product({required this.id, required this.name, required this.price});
}
