import 'dart:async';

import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class ProductBloc {
  final _repository = Repository();
  final _productFetcher = PublishSubject<List<ProductModel>>();

  Stream<List<ProductModel>> get allProducts => _productFetcher.stream;

  fetchAllProducts(String categoryId) async {
    List<ProductModel> productModel =
        await _repository.fetchAllProducts(categoryId);
    _productFetcher.sink.add(productModel);
  }

  dispose() {
    _productFetcher.close();
  }
}
