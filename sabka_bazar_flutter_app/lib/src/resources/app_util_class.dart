import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtilClass {
  static void showSnackBar(BuildContext context, String message, int duration) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.pink.shade800,
      duration: Duration(seconds: duration),
    );
    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> saveCartCount(int cartCount) async {
    //TODO: this is how we can save information is user default after successful login/signup
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter') ?? 0) + 1;
    // print('Pressed $counter times.');
    await prefs.setInt('cartCount', cartCount);
  }

  static Future<int> getCartCount() async {
    //TODO: this is how we can save information is user default after successful login/signup
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter') ?? 0) + 1;
    // print('Pressed $counter times.');
    return prefs.getInt('cartCount') ?? 0;
  }

  static String getTextNoOfItemInCart(int cartLength) {
    var numberOfItemsCart = '$cartLength item';
    if (cartLength > 1) {
      numberOfItemsCart = '$cartLength items';
    }
    return numberOfItemsCart;
  }

  static Future<void> showMyDialog(
    BuildContext context,
    String title,
    List<Widget> listWidget,
    List<Widget> actions,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: listWidget,
            ),
          ),
          actions: actions,
        );
      },
    );
  }

/*
<Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
 */
}
