import 'package:ecommerce/configs/routes.dart';
import 'package:ecommerce/providers/auth_logic.dart';
import 'package:ecommerce/providers/cart_logic.dart';
import 'package:ecommerce/providers/order_logic.dart';
import 'package:ecommerce/providers/products_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthLogic()),
        ChangeNotifierProvider(create: (_) => ProductLogic()),
        ChangeNotifierProvider(create: (_) => CartLogic()),
        ChangeNotifierProvider(create: (_) => OrderLogic()),
      ],
      child: MaterialApp(
        title: 'Ecom',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.blueGrey,
        ),
        routes: routes,
      ),
    );
  }
}
