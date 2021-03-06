import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/product_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_divider.dart';
import 'package:sabka_bazar_flutter_app/src/components/category_title_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/resources/app_util_class.dart';
import 'package:sabka_bazar_flutter_app/src/screens/cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  static const String routName = "/product_list";
  final String categoryName;
  final String categoryId;

  const ProductListScreen({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final bloc = ProductBloc();
  int _cartCount = 0;

  @override
  void initState() {
    super.initState();
    bloc.fetchAllProducts(widget.categoryId);
    _checkCartCount();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        cartCount: _cartCount,
        cartCloseAction: () => _checkCartCount(),
      ),
      body: Column(
        children: [
          Container(
            child: CategoryTitleWidget(
              title: widget.categoryName,
              onCloseProductList: () => Navigator.pop(context),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.allProducts,
              builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.length == 0)
                    return Center(
                        child: Text(
                      'No products available for this category',
                    ));
                  return _getProductListView(snapshot);
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          CopyrightWidget(),
        ],
      ),
    );
  }

  ListView _getProductListView(AsyncSnapshot<List<ProductModel>> snapshot) {
    var data = snapshot.data!;
    return ListView.separated(
        separatorBuilder: (context, index) {
          return AppDivider();
        },
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data[index].name.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Image.asset(
                      data[index].imageURL.toString(),
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 30),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            color: Colors.grey.shade200,
                            child: Text(
                              data[index].description.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: AppButton(
                              buttonText: "Buy Now @ MRP Rs." +
                                  data[index].price.toString(),
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(
                                        productFromProductList: data[index]),
                                    fullscreenDialog: true,
                                  ),
                                ).then((value) => _checkCartCount()),
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        });
  }

  void _checkCartCount() {
    AppUtilClass.getCartCount().then((value) {
      setState(() {
        _cartCount = value;
      });
    });
  }
}
