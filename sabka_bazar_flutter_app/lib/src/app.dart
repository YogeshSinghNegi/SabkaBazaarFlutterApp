import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/screens/empty_cart_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/non_empty_cart_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/splash_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/login_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/signup_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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



