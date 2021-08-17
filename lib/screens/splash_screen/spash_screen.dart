import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:ecommerce/screens/signinup/signinup_screen.dart';
import 'package:ecommerce/services/token.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    final String _seen = await getToken();

    if (_seen.isEmpty) {
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(SignInUpScreen.routeName, (route) => false);
    } else {
      Navigator.of(
        context,
      ).pushReplacementNamed(MainScreen.routeName);
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold();
  }
}
