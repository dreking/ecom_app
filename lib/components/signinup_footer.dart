import 'package:ecommerce/configs/size_config.dart';
import 'package:flutter/material.dart';

class SignInUpFooter extends StatelessWidget {
  final String text;
  final String title;
  final Function onTap;

  const SignInUpFooter({
    Key? key,
    required this.title,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(14),
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap as void Function()?,
          child: Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
