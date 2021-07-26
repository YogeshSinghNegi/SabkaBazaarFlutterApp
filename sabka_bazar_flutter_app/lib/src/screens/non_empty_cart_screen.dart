import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc_provider.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/shadow_container.dart';

class NonEmptyCartScreen extends StatefulWidget {
  static const String routName = "/non_empty_cart";

  const NonEmptyCartScreen({Key? key}) : super(key: key);

  @override
  _NonEmptyCartScreenState createState() => _NonEmptyCartScreenState();
}

class _NonEmptyCartScreenState extends State<NonEmptyCartScreen> {
  late List<CartModel> _cartList;
  late CartBloc bloc;
  @override
  void initState() {
    super.initState();

  }

  void didChangeDependencies() {
    bloc = CartBlocProvider.of(context);
    bloc.fetchAllCartProduct();
    print("recreated");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myCartAppBar(),
      body: StreamBuilder(
        stream:bloc.allCartProducts,
        builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
          if (snapshot.hasData) {
            return cartData(snapshot.data!);
          } else if (snapshot.hasError) {
            return cartEmpty();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget cartEmpty() {
    return SafeArea(
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
    );
  }

  PreferredSizeWidget myCartAppBar() {
    // return if(_cartList.isNotEmpty){
    //   return  SafeArea(
    //     child: Column(
    //       children: [
    //         Expanded(child: Container()),
    //         Text(
    //           'No items in your cart',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontSize: 24,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         SizedBox(height: 10),
    //         Text(
    //           'Your favourite items are just a click away',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontSize: 18,
    //           ),
    //         ),
    //         Expanded(child: Container()),
    //         Container(
    //           width: (MediaQuery.of(context).size.width),
    //           height: 60,
    //           child: Padding(
    //             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    //             child: AppButton(
    //               buttonText: 'Start Shopping',
    //               onPressed: () => {},
    //               borderRadius: 5,
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   );
    // }else {
    return AppBar(
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
    );
    // }
  }

  Widget cartData(List<CartModel> model) {
    _cartList = model;
    return Column(
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
                  _getItemListWidget(),
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
                    onPressed: () => {},
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
                            'Rs.' + "1212",
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
    );
  }

  Column _getItemListWidget() {
    return Column(
        children: _cartList
            .map((element) => Container(
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
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You won\'t find it cheaper anywhere',
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
                                        bloc.substraction.add(element.productId ?? "")
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    _cartList.length.toString(),
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
                                      onPressed: () => {  bloc.addition.add(element)},
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
                                      'Rs.' + element.price.toString(),
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
                ))
            .toList());
  }

  String _getNumberOfItemCart() {
    var numberOfItemsCart = '(1 item)';
    if (_cartList.length > 1) {
      numberOfItemsCart = '(${_cartList.length} items)';
    }
    return numberOfItemsCart;
  }
}
