import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/screens/non_empty_cart_screen.dart';

class SplashScreen extends StatefulWidget {
  static const appLogo = "AppLogo";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// We might use splash to fetch some default config for application for now we
// are navigating to landing screen to after 3 seconds.
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context)
            .pushReplacementNamed(NonEmptyCartScreen.routName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
            ],
          ),
        ),
      ),
    );
  }
}
