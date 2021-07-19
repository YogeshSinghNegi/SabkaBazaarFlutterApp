import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double minusWidth;
  final Color dividerColor;

  const AppDivider({
    this.minusWidth = 40,
    this.dividerColor = Colors.grey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(minusWidth, 0, minusWidth, 0),
      child: Divider(
        height: 1,
        color: dividerColor,
      ),
    );
  }
}
