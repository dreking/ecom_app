import 'package:ecommerce/configs/size_config.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold();
  }
}
