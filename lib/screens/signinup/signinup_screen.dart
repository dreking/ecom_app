import 'package:ecommerce/screens/signinup/body.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/configs/size_config.dart';

class SignInUpScreen extends StatelessWidget {
  static const routeName = '/signin-up';

  const SignInUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: BodyWidget(),
    );
  }
}
