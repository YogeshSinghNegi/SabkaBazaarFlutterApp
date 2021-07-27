import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class CartBloc {
  final _repository = Repository();

  /// Sinks
  Sink<CartModel> get addition => cartItemAddition.sink;
  final cartItemAddition = StreamController<CartModel>();

  Sink<String> get substraction => cartItemSubtraction.sink;
  final cartItemSubtraction = StreamController<String>();

  Sink<String> get clear => cartItemClear.sink;
  final cartItemClear = StreamController<String>();

  /// Streams

  Stream<List<CartModel>> get allCartProducts => _cartFetcher.stream;
  final _cartFetcher = BehaviorSubject<List<CartModel>>();

  CartBloc() {
    cartItemAddition.stream.listen(handleItemAdd);
    cartItemSubtraction.stream.listen(handleItemRem);
    cartItemClear.stream.listen(clearCart);
  }

  fetchAllCartProduct() async {
    List<CartModel> cartModel = await _repository.fetchAllCartProducts();
    _cartFetcher.sink.add(cartModel);
  }

  ///
  /// Logic for product added to shopping cart.
  ///
  void handleItemAdd(CartModel item) async {
    List<CartModel> cartModel = await _repository.cartProductAdd(item);
    _cartFetcher.sink.add(cartModel);
  }

  ///
  /// Logic for product removed from shopping cart.
  ///
  void handleItemRem(String id) async {
    List<CartModel> cartModel = await _repository.cartProductDelete(id);
    _cartFetcher.sink.add(cartModel);
  }

  void clearCart(String id) async {
    List<CartModel> cartModel = await _repository.cartClear();
    _cartFetcher.sink.add(cartModel);
  }

  dispose() async {
    cartItemAddition.close();
    cartItemSubtraction.close();
    cartItemClear.close();
  }
}
