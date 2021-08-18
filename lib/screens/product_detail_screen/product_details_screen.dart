import 'package:flutter/material.dart';

import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/screens/product_detail_screen/body.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
