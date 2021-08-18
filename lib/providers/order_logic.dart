import 'dart:convert';

import 'package:ecommerce/data/get_urls.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/order.dart';
import 'package:ecommerce/models/server_response.dart';
import 'package:ecommerce/services/token.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OrderLogic with ChangeNotifier {
  final String _domain = getServerDomain() + '/orders';

  List<Order> _orders = [];

  Future<ServerResponse> createOrder(List<Cart> cart) async {
    final uri = Uri.parse(_domain);
    final token = await getToken();

    try {
      List stringCart = [];
      for (var i = 0; i < cart.length; i++) {
        final product = cart[i].product!;

        stringCart.add({
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'image': product.imageUrl,
          'brand': product.brand,
          'quantity': product.quantity,
        });
      }

      final response = await http.post(
        uri,
        body: jsonEncode({'products': stringCart}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      final serverResponse = ServerResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      if (response.statusCode == 422) {
        serverResponse.message = serverResponse.message! + '\n';
        serverResponse.errors!.forEach((element) {
          serverResponse.message = serverResponse.message! + '${element.msg}\n';
        });
      }

      if (response.statusCode == 201) {
        final order = Order.fromJson(
          jsonDecode(response.body)['data'] as Map<String, dynamic>,
        );
        _orders.add(order);

        notifyListeners();
      }

      return serverResponse;
    } catch (e) {
      print(e);
      return ServerResponse(
        status: false,
        message: 'Something went wrong. Please try again later',
      );
    }
  }

  Future<void> getAllOrders() async {
    final uri = Uri.parse(_domain);
    final token = await getToken();

    try {
      final response = await http.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        final orders =
            jsonDecode(response.body)['orders'].cast<Map<String, dynamic>>();
        _orders = orders.map<Order>((json) => Order.fromJson(json)).toList();

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  List<Order> get orders {
    return [..._orders];
  }
}
