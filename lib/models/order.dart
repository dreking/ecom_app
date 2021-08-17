import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/user.dart';

class Order {
  String? id;
  User? user;
  List<Product>? products;
  DateTime? createdAt;

  Order({
    this.id,
    this.user,
    this.products,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final user = User.fromJson(json['userid']);
    final List<Product> products = json['products']
        .cast<Map<String, dynamic>>()
        .map<Product>((product) => Product.fromJson(json))
        .toList();

    return Order(
      id: json['_id'] as String,
      user: user,
      products: products,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
