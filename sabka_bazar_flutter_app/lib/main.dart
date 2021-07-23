import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/screens/empty_cart_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/login_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/non_empty_cart_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/signup_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SplashScreen(),
      routes: {
        HomeScreen.routName: (_) => HomeScreen(),
        LoginScreen.routName: (_) => LoginScreen(),
        SignupScreen.routName: (_) => SignupScreen(),
        EmptyCartScreen.routName: (_) => EmptyCartScreen(),
        NonEmptyCartScreen.routName: (_) => NonEmptyCartScreen(),
      },
    );
  }
}
