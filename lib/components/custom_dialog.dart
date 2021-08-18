import 'package:ecommerce/configs/size_config.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? text;
  final bool? status;
  final String buttonText;
  final Function onTap;

  CustomDialog({
    required this.title,
    required this.text,
    required this.onTap,
    this.status = true,
    this.buttonText = 'Okay',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(20)),
      ),
      title: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          color: Colors.white,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.all(15),
      actions: <Widget>[
        CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          child: IconButton(
            icon: Icon(Icons.check),
            color: Colors.white,
            onPressed: onTap as void Function()?,
          ),
        ),
      ],
    );
  }
}
