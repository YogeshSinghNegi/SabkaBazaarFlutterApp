import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/cart_bloc_provider.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_loader.dart';
import 'package:sabka_bazar_flutter_app/src/screens/empty_cart_screen.dart';
import 'package:sabka_bazar_flutter_app/src/screens/non_empty_cart_screen.dart';

class CartScreenContainer extends StatefulWidget {
  static const String routName = "/cart_screen";
  final ProductModel? productFromProductList ;

  const CartScreenContainer({Key? key, this.productFromProductList}) : super(key: key);

  @override
  _CartScreenContainerState createState() => _CartScreenContainerState();
}

class _CartScreenContainerState extends State<CartScreenContainer> {
  late CartBloc newBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    newBloc = CartBlocProvider.of(context);
    if( widget.productFromProductList != null){
      newBloc.addition.add(CartModel.fromJson(widget.productFromProductList!.toJson()));
    }else{ newBloc.fetchAllCartProduct();}

    print("recreated");
    super.didChangeDependencies();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CartBloc>('bloc', newBloc));
  }

  // @override
  // void dispose() {
  //  // newBloc.dispose();
  //   //super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: newBloc.allCartProducts,
      builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty){
            return EmptyCartScreen();
          }
          return NonEmptyCartScreen(cartList: snapshot.data!, emptyCartBloc: newBloc);
        } else if (snapshot.hasError) {
          return EmptyCartScreen();
        }
        return AppLoader(isShowCrossButton: true);
      },
    );
  }
}
