import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc_provider.dart';
import 'package:sabka_bazar_flutter_app/src/screens/cart_screen_container.dart';
import 'package:sabka_bazar_flutter_app/src/screens/home_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/login_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/signup_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartBlocProvider(
      child: MaterialApp(
        theme: ThemeData.light(),
        home: SplashScreen(),
        routes: {
          HomeScreen.routName: (_) => HomeScreen(),
          LoginScreen.routName: (_) => LoginScreen(),
          SignupScreen.routName: (_) => SignupScreen(),
          CartScreenContainer.routName: (_) => CartScreenContainer(),
        },
      ),
    );
  }
}
