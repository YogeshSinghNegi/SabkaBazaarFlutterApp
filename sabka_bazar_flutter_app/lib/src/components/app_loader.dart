import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';

class AppLoader extends StatelessWidget {
  final bool isShowCrossButton;

  const AppLoader({
    this.isShowCrossButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        isHideCartButton: true,
        isShowCrossButton: isShowCrossButton,
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
