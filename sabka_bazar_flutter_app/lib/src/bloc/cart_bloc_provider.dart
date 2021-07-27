import 'package:flutter/material.dart';
import 'cart_bloc.dart';
export 'cart_bloc.dart';

class CartBlocProvider extends InheritedWidget {
  final CartBloc bloc;

  CartBlocProvider({Key? key, required Widget child})
      : bloc = CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static CartBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CartBlocProvider>()
            as CartBlocProvider)
        .bloc;
  }
}
