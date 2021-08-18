import 'package:ecommerce/components/custom_loading_spinner.dart';
import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/providers/products_logic.dart';
import 'package:ecommerce/screens/main_screen/product_widget.dart';
import 'package:ecommerce/screens/product_detail_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBody extends StatefulWidget {
  MainBody({Key? key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  bool _isLoading = false;
  bool _isInit = true;

  void _loadData() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<ProductLogic>(context, listen: false).getAllProducts();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit) _loadData();
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductLogic>(context).products;

    return _isLoading
        ? CustomLoadingSpinner()
        : Container(
            color: Colors.white,
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              crossAxisCount: 2,
              mainAxisSpacing: getProportionateScreenHeight(20),
              crossAxisSpacing: getProportionateScreenWidth(15),
              childAspectRatio: getProportionateScreenHeight(0.7),
              children: products
                  .map(
                    (product) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailsScreen.routeName,
                          arguments: product,
                        );
                      },
                      child: ProductWidget(product: product),
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
