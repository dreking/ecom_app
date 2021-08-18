import 'package:ecommerce/models/product.dart';

class Cart {
  int? id;
  Product? product;
  DateTime? createdAt;

  Cart({
    this.id,
    this.product,
    this.createdAt,
  });
}
