import 'dart:convert';

import 'package:ecommerce/data/get_urls.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductLogic with ChangeNotifier {
  List<Product> _products = [];

  Future<void> getAllProducts() async {
    final uri = Uri.parse(getProductsUrl());

    try {
      final response = await http.get(
        uri,
        headers: {
          'x-rapidapi-key':
              '2ccda791a9mshcfd9136f5b996bep14f4bejsnc38c6e62b61a',
          'x-rapidapi-host': 'asos2.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        final products = jsonDecode(response.body)['products']
            .cast<Map<String, dynamic>>()
            .map<Product>((json) => Product.fromJson(json))
            .toList();

        _products = [...products];
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  List<Product> get products {
    return [..._products];
  }
}
