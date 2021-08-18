import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/data/get_urls.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          getProportionateScreenHeight(10),
        ),
      ),
      elevation: 5,
      child: Container(
        height: getProportionateScreenHeight(200),
        width: getProportionateScreenWidth(100),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenHeight(10),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/placeholder.png',
                  image: getImageUrl(product.imageUrl!),
                  height: getProportionateScreenHeight(200),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                product.name!,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '\$ ' + product.price!.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
