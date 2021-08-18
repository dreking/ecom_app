import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/cupertino.dart';

class CartLogic with ChangeNotifier {
  List<Cart> _cartItems = [];

  bool addToCart(Product product) {
    final productIndex = _cartItems.indexWhere(
      (element) => element.id == product.id,
    );

    if (productIndex == -1) {
      product.quantity = 1;
      _cartItems.add(
        Cart(
          id: product.id,
          product: product,
          createdAt: DateTime.now(),
        ),
      );
    } else {
      final quantity = _cartItems[productIndex].product!.quantity;
      _cartItems[productIndex].product!.quantity = quantity! + 1;
    }

    notifyListeners();

    return true;
  }

  List<Cart> get cartItems {
    return [..._cartItems];
  }

  double get totalAmount {
    var total = 0.0;

    if (_cartItems.length == 0) return total;

    _cartItems.forEach((cartItem) {
      total = total + (cartItem.product!.price! * cartItem.product!.quantity!);
    });

    return total;
  }

  bool removeItem(int cartId) {
    _cartItems.removeWhere((element) => element.id == cartId);
    notifyListeners();

    return true;
  }

  void clear() {
    _cartItems = [];

    notifyListeners();
  }
}
