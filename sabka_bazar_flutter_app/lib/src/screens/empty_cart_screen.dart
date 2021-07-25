import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';

class EmptyCartScreen extends StatelessWidget {
  static const String routName = "/empty_cart";

  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Cart'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            Text(
              'No items in your cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your favourite items are just a click away',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: (MediaQuery.of(context).size.width),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: AppButton(
                  buttonText: 'Start Shopping',
                  onPressed: () => {},
                  borderRadius: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
