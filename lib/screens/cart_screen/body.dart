import 'package:ecommerce/components/custom_button.dart';
import 'package:ecommerce/components/custom_dialog.dart';
import 'package:ecommerce/components/custom_loading_spinner.dart';
import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/providers/cart_logic.dart';
import 'package:ecommerce/providers/order_logic.dart';
import 'package:ecommerce/screens/cart_screen/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;

  List<Cart> _cart = [];

  void _placeOrder() async {
    setState(() {
      _isLoading = true;
    });

    final response = await Provider.of<OrderLogic>(
      context,
      listen: false,
    ).createOrder(_cart);

    setState(() {
      _isLoading = false;
    });

    await showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Create order Status',
        text: response.message,
        onTap: () => Navigator.of(context).pop(),
      ),
    );

    Provider.of<CartLogic>(context, listen: false).clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartLogic>(context);
    _cart = provider.cartItems;
    final total = provider.totalAmount;

    return _isLoading
        ? CustomLoadingSpinner()
        : Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (ctx, index) => CartItemWidget(
                      cartItem: _cart[index],
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Chip(
                      label: Text(
                        '\$ ${total.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                if (_cart.length != 0)
                  CustomButton(onTap: _placeOrder, text: 'Order Now'),
              ],
            ),
          );
  }
}
