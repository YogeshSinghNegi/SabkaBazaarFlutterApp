import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc_provider.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_divider.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_loader.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/components/shadow_container.dart';
import 'package:sabka_bazar_flutter_app/src/resources/app_util_class.dart';

class CartScreen extends StatefulWidget {
  static const String routName = "/cart_screen";
  final ProductModel? productFromProductList;

  const CartScreen({Key? key, this.productFromProductList}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  late  List<CartModel> cartList;
  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartBloc = CartBlocProvider.of(context);
    if (widget.productFromProductList != null) {
      cartBloc.addition
          .add(CartModel.fromJson(widget.productFromProductList!.toJson()));
    } else {
      cartBloc.fetchAllCartProduct();
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CartBloc>('bloc', cartBloc));
  }

  @override
  // void dispose() {
  //   cartBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cartBloc.allCartProducts,
      builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
        cartList = snapshot.data ?? [];
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return _emptyCart(context);
          }
          return _populateCart(context);
        } else if (snapshot.hasError) {
          return _emptyCart(context);
        }
        return AppLoader(isShowCrossButton: true);
      },
    );
  }

  Widget _emptyCart(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Cart'),
        leadingWidth: 0,
        leading: SizedBox(),
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
                  onPressed: () => Navigator.pop(context),
                  borderRadius: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _populateCart(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: MyAppBar(isShowCrossButton: true),
      body: Column(
        children: [_getTopContainer(), _getBottomContainer()],
      ),
    );
  }

  Flexible _getTopContainer() {
    return Flexible(
      child: ListView(
        children: [
          Column(
            children: [
              _getSpace(),
              _getMyCart(),
              _getSpace(),
              _getItemListWidget(context),
              _getSpace(),
              _getLowestPriceView()
            ],
          ),
        ],
      ),
    );
  }

  ShadowContainer _getBottomContainer() {
    return ShadowContainer(
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
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink.shade800),
                ),
                onPressed: () => {
                  cartBloc.clear.add("clear"),
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
    );
  }

  Column _getItemListWidget(BuildContext context) {
    return Column(
        children: cartList
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
                                            cartBloc.substraction
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
                                            cartBloc.addition.add(element),
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

  Container _getMyCart() {
    return Container(
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
    );
  }

  Padding _getLowestPriceView() {
    return Padding(
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
    );
  }

  String _getNumberOfItemCart() {
    var numberOfItemsCart = '(1 item)';
    if (cartList.length > 1) {
      numberOfItemsCart = '(${cartList.length} items)';
    }
    return numberOfItemsCart;
  }

  String _getTotalCart() {
    var sum = 0;
      cartList.forEach((e) => sum += ((e.qty ?? 1) * (e.price ?? 0)));
    return sum.toString();
  }

  SizedBox _getSpace() {
    return SizedBox(height: 20);
  }
}
