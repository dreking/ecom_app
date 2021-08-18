import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce/screens/main_screen/body.dart';
import 'package:ecommerce/screens/order_screen/order_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('E Com'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
            icon: Icon(Icons.event),
          )
        ],
      ),
      body: MainBody(),
    );
  }
}
