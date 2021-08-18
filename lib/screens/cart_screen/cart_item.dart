import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/data/get_urls.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/providers/cart_logic.dart';

class CartItemWidget extends StatelessWidget {
  final Cart cartItem;

  CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart)
          Provider.of<CartLogic>(
            context,
            listen: false,
          ).removeItem(cartItem.id!);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(4),
        ),
        child: Icon(
          Icons.delete,
          size: getProportionateScreenHeight(40),
          color: Colors.white,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(15)),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        width: double.infinity,
        height: getProportionateScreenHeight(150),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x1c000000),
              offset: Offset(0, 2),
              blurRadius: getProportionateScreenWidth(10),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenHeight(10)),
              child: FadeInImage.assetNetwork(
                placeholder: 'images/placeholder.png',
                image: getImageUrl(cartItem.product!.imageUrl),
                fit: BoxFit.cover,
                width: getProportionateScreenWidth(98),
                height: getProportionateScreenHeight(98),
              ),
            ),
            SizedBox(width: SizeConfig.screenHeight * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cartItem.product!.name!,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    'Unit Price: \$ ${cartItem.product!.price}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'Quantity: ${cartItem.product!.quantity}x',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    'Total: \$ ${cartItem.product!.price! * cartItem.product!.quantity!}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(13),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
