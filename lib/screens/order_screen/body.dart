import 'package:ecommerce/components/custom_loading_spinner.dart';
import 'package:ecommerce/providers/order_logic.dart';
import 'package:ecommerce/screens/order_screen/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  bool _isInit = true;

  void _loadData() async {
    setState(() {
      _isLoading = true;
    });

    await Provider.of<OrderLogic>(
      context,
      listen: false,
    ).getAllOrders();

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
    final orders = Provider.of<OrderLogic>(context).orders;

    return _isLoading
        ? CustomLoadingSpinner()
        : ListView.builder(
            itemCount: orders.length,
            itemBuilder: (ctx, index) => OrderWidget(order: orders[index]),
          );
  }
}
