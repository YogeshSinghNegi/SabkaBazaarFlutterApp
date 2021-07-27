import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_divider.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/components/shadow_container.dart';
import 'package:sabka_bazar_flutter_app/src/resources/app_util_class.dart';

class NonEmptyCartScreen extends StatefulWidget {
  final List<CartModel> cartList;
  final CartBloc nonEmptyCartBloc;

  const NonEmptyCartScreen({
    required this.cartList,
    required this.nonEmptyCartBloc,
    Key? key,
  }) : super(key: key);

  @override
  _NonEmptyCartScreenState createState() => _NonEmptyCartScreenState();
}

class _NonEmptyCartScreenState extends State<NonEmptyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: MyAppBar(isShowCrossButton: true),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: (MediaQuery.of(context).size.width),
                      height: 65,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'My Cart',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _getNumberOfItemCart(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _getItemListWidget(context),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Image.asset(
                                'assets/images/lowest_price.png',
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                'You won\'t find it cheaper anywhere',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Expanded(child: Container()),
          ShadowContainer(
            child: Column(
              children: [
                SizedBox(height: 15),
                Text(
                  'Promo code can be applied on payment page',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.pink.shade800),
                      ),
                      onPressed: () => {
                        widget.nonEmptyCartBloc.clearCart(),
                        AppUtilClass.showSnackBar(
                            context, 'Order is placed Successfully', 2)
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Text(
                              'Proceed to Checkout',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              'Rs.' + _getTotalCart(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_ios, size: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _getItemListWidget(BuildContext context) {
    return Column(
        children: widget.cartList
            .map((element) => Column(
                  children: [
                    Container(
                      // height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
                            child: Image.asset(
                              element.imageURL.toString(),
                              height: 100,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    element.name.toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 40,
                                        child: AppButton(
                                          buttonImage: Icons.remove,
                                          isImageOnly: true,
                                          borderRadius: 5,
                                          onPressed: () => {
                                            widget.nonEmptyCartBloc.substraction
                                                .add(element.productId ?? ""),
                                            AppUtilClass.showSnackBar(context,
                                                'Product Removed from cart', 2)
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        element.qty.toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        height: 30,
                                        width: 40,
                                        child: AppButton(
                                          buttonImage: Icons.add,
                                          isImageOnly: true,
                                          borderRadius: 5,
                                          onPressed: () => {
                                            widget.nonEmptyCartBloc.addition
                                                .add(element),
                                            AppUtilClass.showSnackBar(context,
                                                'Product Added to cart', 2)
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'X',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Rs.' + element.price.toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Rs.' +
                                              ((element.price ?? 0) *
                                                      (element.qty ?? 1))
                                                  .toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDivider(),
                  ],
                ))
            .toList());
  }

  String _getNumberOfItemCart() {
    var numberOfItemsCart = '(1 item)';
    if (widget.cartList.length > 1) {
      numberOfItemsCart = '(${widget.cartList.length} items)';
    }
    return numberOfItemsCart;
  }

  String _getTotalCart() {
    var sum = 0;
    if (widget.cartList.length > 1) {
      widget.cartList.forEach((e) => sum += ((e.qty ?? 1) * (e.price ?? 0)));
    }
    return sum.toString();
  }
}
