import 'package:ecommerce/configs/size_config.dart';
import 'package:flutter/material.dart';

class CustomInputCard extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CustomInputCard({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: color ?? null,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(10),
        ),
        child: child,
      ),
    );
  }
}
