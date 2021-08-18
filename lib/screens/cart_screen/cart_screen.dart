import 'package:flutter/material.dart';

import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/screens/cart_screen/body.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/view-cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Body(),
    );
  }
}
