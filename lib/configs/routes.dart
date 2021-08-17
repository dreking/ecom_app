import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:ecommerce/screens/signinup/signinup_screen.dart';
import 'package:ecommerce/screens/splash_screen/spash_screen.dart';

final routes = {
  SplashScreen.routeName: (ctx) => SplashScreen(),
  SignInUpScreen.routeName: (ctx) => SignInUpScreen(),
  MainScreen.routeName: (ctx) => MainScreen(),
};
