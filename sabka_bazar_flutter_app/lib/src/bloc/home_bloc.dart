import 'dart:async';

import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class HomeBloc {
  final _repository = Repository();
  final _offerFetcher = PublishSubject<List<OfferModel>>();
  final _categoryFetcher = PublishSubject<List<CategoryModel>>();
  final _productFetcher = PublishSubject<List<ProductModel>>();

  Stream<List<OfferModel>> get allOffers => _offerFetcher.stream;
  Stream<List<CategoryModel>> get allCategory => _categoryFetcher.stream;
  Stream<List<ProductModel>> get allProducts => _productFetcher.stream;

  fetchAllOffers() async {
    List<OfferModel> offerModelList = await _repository.fetchAllOffers();
    _offerFetcher.sink.add(offerModelList);
  }

  fetchAllCategories() async {
    List<CategoryModel> categoryModel = await _repository.fetchAllCategory();
    _categoryFetcher.sink.add(categoryModel);
  }

  fetchAllProducts(String categoryId) async {
    List<ProductModel> productModel =
        await _repository.fetchAllProducts(categoryId);
    _productFetcher.sink.add(productModel);
  }

  dispose() {
    _offerFetcher.close();
    _categoryFetcher.close();
    _productFetcher.close();
  }
}

final bloc = HomeBloc();
