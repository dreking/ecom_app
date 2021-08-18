import 'package:ecommerce/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:ecommerce/screens/order_screen/order_screen.dart';
import 'package:ecommerce/screens/product_detail_screen/product_details_screen.dart';
import 'package:ecommerce/screens/signinup/signinup_screen.dart';
import 'package:ecommerce/screens/splash_screen/spash_screen.dart';

final routes = {
  SplashScreen.routeName: (ctx) => SplashScreen(),
  SignInUpScreen.routeName: (ctx) => SignInUpScreen(),
  MainScreen.routeName: (ctx) => MainScreen(),
  ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
  CartScreen.routeName: (ctx) => CartScreen(),
  OrderScreen.routeName: (ctx) => OrderScreen(),
};
