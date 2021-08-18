import 'package:ecommerce/models/product.dart';

class Order {
  String? id;
  List<Product>? products;
  double? total;
  DateTime? createdAt;

  Order({
    this.id,
    this.products,
    this.createdAt,
    this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final productsJson = json['products'].cast<Map<String, dynamic>>();
    final products = productsJson
        .map<Product>((json) => Product.fromServerJson(json))
        .toList();

    return Order(
      id: json['_id'] as String,
      products: [...products],
      total: json['total'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
