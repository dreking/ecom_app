import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/screens/order_screen/body.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/view-order';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Body(),
    );
  }
}
