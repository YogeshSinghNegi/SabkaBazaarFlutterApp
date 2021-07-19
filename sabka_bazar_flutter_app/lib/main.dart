import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/screens/login_screen.dart';
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
      },
    );
  }
}
