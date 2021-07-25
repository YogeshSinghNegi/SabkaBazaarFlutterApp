import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabka_bazar_flutter_app/src/screens/non_empty_cart_screen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHideCartButton;
  final bool isShowCrossButton;

  const MyAppBar({
    this.isHideCartButton = false,
    this.isShowCrossButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Image.asset(
          'assets/images/logo_small.png',
        ),
      ),
      leadingWidth: 90,
      backgroundColor: Colors.white,
      elevation: 6,
      actions: _getActionList(context),
    );
  }

  List<Widget> _getActionList(BuildContext context) {
    if (isHideCartButton)
      return [];
    else if (isShowCrossButton)
      return [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: Colors.pink.shade800, size: 30),
        )
      ];
    else
      return [
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          color: Colors.grey.shade200,
          child: TextButton(
            onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NonEmptyCartScreen(),
                    fullscreenDialog: true,
                  ),
                )),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: SvgPicture.asset(
                    'assets/images/cart.svg',
                    color: Colors.pink.shade800,
                    height: 30,
                    width: 30,
                  ),
                ),
                Text(
                  "0 Items",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ];
  }
}
