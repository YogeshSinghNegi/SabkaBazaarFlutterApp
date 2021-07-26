import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart' ;
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class CartBloc  {
  final _repository = Repository();
  List<CartModel> cart = [];

  /// Sinks
  Sink<CartModel> get addition => itemAdditionController.sink;
  final itemAdditionController = StreamController<CartModel>();

  Sink<String> get substraction => itemSubtractionController.sink;
  final itemSubtractionController = StreamController<String>();

  /// Streams
  Stream<List<CartModel>> get allCartProducts => _cartFetcher.stream;
  final _cartFetcher = BehaviorSubject<List<CartModel>>();

  CartBloc() {
    itemAdditionController.stream.listen(handleItemAdd);
    itemSubtractionController.stream.listen(handleItemRem);
  }


  fetchAllCartProduct() async {
    List<CartModel> cartModel  = await _repository.fetchAllCartProducts();
    _cartFetcher.sink.add(cartModel);
  }

  ///
  /// Logic for product added to shopping cart.
  ///
  void handleItemAdd(CartModel item)async {
    List<CartModel> cartModel  = await _repository.cartProductAdd(item);
    _cartFetcher.sink.add(cartModel);
  }

  ///
  /// Logic for product removed from shopping cart.
  ///
  void handleItemRem(String id)async {
    List<CartModel> cartModel  = await _repository.cartProductDelete(id);
    _cartFetcher.sink.add(cartModel);
  }

  dispose() async {
    itemAdditionController.close();
    itemSubtractionController.close();
    _cartFetcher.close();
  }

}

// final bloc = CartBloc();
