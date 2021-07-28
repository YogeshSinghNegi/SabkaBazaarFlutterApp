import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sabka_bazar_flutter_app/src/resources/app_util_class.dart';
import 'package:sabka_bazar_flutter_app/src/screens/cart_screen.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isHideCartButton;
  final bool isShowCrossButton;
  final int cartCount;
  final Function? cartCloseAction;

  const MyAppBar({
    this.isHideCartButton = false,
    this.isShowCrossButton = false,
    this.cartCount = 0,
    this.cartCloseAction,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
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
    if (widget.isHideCartButton)
      return [];
    else if (widget.isShowCrossButton)
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
                    builder: (context) => CartScreen(),
                    fullscreenDialog: true,
                  ),
                ).then((value) => widget.cartCloseAction!())),
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
                FutureBuilder(
                  future: AppUtilClass.getCartCount(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }
                    return Text(
                      AppUtilClass.getTextNoOfItemInCart(widget.cartCount == 0
                          ? snapshot.data as int
                          : widget.cartCount),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ];
  }
}
