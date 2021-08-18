import 'package:ecommerce/components/custom_button.dart';
import 'package:ecommerce/components/custom_snackbar.dart';
import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/data/get_urls.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/cart_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                getProportionateScreenWidth(50),
              ),
              bottomRight: Radius.circular(
                getProportionateScreenWidth(50),
              ),
            ),
          ),
          elevation: 5,
          child: Container(
            height: getProportionateScreenHeight(350),
            child: Stack(
              children: [
                Hero(
                  tag: product.id!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        getProportionateScreenWidth(50),
                      ),
                      bottomRight: Radius.circular(
                        getProportionateScreenWidth(50),
                      ),
                    ),
                    child: SafeArea(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'images/placeholder.png',
                        image: getImageUrl(product.imageUrl!),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.chevron_left,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            children: [
              Text(
                product.name!,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
              Text(
                product.brand!,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                '\$ ' + product.price!.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                product.brand!,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: CustomButton(
            onTap: () {
              final response = Provider.of<CartLogic>(
                context,
                listen: false,
              ).addToCart(product);

              final snackBar = buildCustomSnackBar(
                context,
                field: product.brand!,
                status: response,
              );

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(snackBar as SnackBar);
            },
            text: 'Add to Cart',
          ),
        )
      ],
    );
  }
}
