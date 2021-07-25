import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/home_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_divider.dart';
import 'package:sabka_bazar_flutter_app/src/components/category_title_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';

import 'empty_cart_screen.dart';

class ProductListScreen extends StatefulWidget {
  static const String routName = "/product_list";
  final String categoryName;
  final String categoryId;

  const ProductListScreen(
      {Key? key, required this.categoryName, required this.categoryId})
      : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  @override
  void initState() {
    super.initState();
    bloc.fetchAllProducts();
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
      appBar: MyAppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
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
                  return _getProductListView(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
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
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[index].name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  // TODO: IMAGE  URL IS FROM NETWORK  UPDATE IT
                  // Image.asset(
                  //   data[index].imageURL.toString(),
                  //   width: 150,
                  //   height: 150,
                  // ),
                  SizedBox(height: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                                  builder: (context) => EmptyCartScreen(),
                                  fullscreenDialog: true,
                                ),
                              )
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
      }
    );
  }
}
