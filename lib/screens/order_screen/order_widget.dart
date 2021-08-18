import 'dart:math';

import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('dd/MM/yyyy hh:mm');

    return Card(
      margin: EdgeInsets.all(getProportionateScreenHeight(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Order Id: ${widget.order.id}',
                      maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ],
              ),
            ),
            Chip(
              backgroundColor: Theme.of(context).primaryColor,
              label: Text(
                '\$ ${widget.order.total}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Date & Time: ${format.format(widget.order.createdAt!)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            if (_isExpanded)
              Container(
                height: min(
                  widget.order.products!.length * 20.0 + 100,
                  100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Full Detail List',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: widget.order.products!
                            .map(
                              (product) => ListTile(
                                title: Text(product.name!),
                                trailing: Text(
                                  'Quantity: ${product.quantity!} x\nPrice: \$ ${product.price!}',
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
