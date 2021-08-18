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

  factory Product.fromServerJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      brand: json['brandName'],
      imageUrl: json['imageUrl'],
      price: json['price']['current']['value'].toDouble(),
    );
  }
}
