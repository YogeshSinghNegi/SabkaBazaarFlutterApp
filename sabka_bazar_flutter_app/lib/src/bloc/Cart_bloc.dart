import 'dart:async';
import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class CartBloc {
  final _repository = Repository();
  final _cartFetcher = PublishSubject<List<ProductModel>>();

  Stream<List<ProductModel>> get allCartProducts => _cartFetcher.stream;

  fetchAllCartProduct() async {
    List<ProductModel> productModel  = await _repository.fetchAllCartProducts();
    _cartFetcher.sink.add(productModel);
  }

  dispose() {
    _cartFetcher.close();

  }
}

final bloc = CartBloc();
