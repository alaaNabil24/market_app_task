import 'package:hive/hive.dart';

part 'product_data.g.dart'; // This will be generated

@HiveType(typeId: 0) // Unique ID for this model
class Product {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final num rating;

  @HiveField(5)
  final num price;

  Product({
    required this.id,
    required this.image,
    this.rating = 0.0,
    required this.title,
    required this.price,
    required this.description,
  });
}