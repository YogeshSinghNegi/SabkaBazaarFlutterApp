import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

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
      actions: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          color: Colors.grey.shade200,
          child: TextButton(
            onPressed: (() => {}),
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
      ],
    );
  }
}
