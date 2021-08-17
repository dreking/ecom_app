class Product {
  int? id;
  String? name;
  String? brand;
  String? imageUrl;
  double? price;
  int? quantity;

  Product({
    this.id,
    this.name,
    this.brand,
    this.imageUrl,
    this.price,
    this.quantity = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      brand: json['brandName'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price']['current']['value'],
      quantity: json['quantity'] as int,
    );
  }
}
