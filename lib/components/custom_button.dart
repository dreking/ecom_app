import 'package:ecommerce/configs/size_config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  CustomButton({
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
      fillColor: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: TextStyle(
        fontSize: getProportionateScreenWidth(20),
      ),
      child: Text(text.toUpperCase()),
      onPressed: onTap as void Function()?,
    );
  }
}
