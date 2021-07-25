import 'dart:async';
import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class HomeBloc {
  final _repository = Repository();
  final _offerFetcher = PublishSubject<OfferModel>();
  final _categoryFetcher = PublishSubject<CategoryModel>();
  final _productFetcher = PublishSubject<ProductModel>();

  Stream<OfferModel> get allOffers => _offerFetcher.stream;
  Stream<CategoryModel> get allCategory => _categoryFetcher.stream;
  Stream<ProductModel> get allProducts => _productFetcher.stream;

  fetchAllOffers() async {
   OfferModel offerModel  = await _repository.fetchAllOffers();
    _offerFetcher.sink.add(offerModel);
  }

  fetchAllCategories() async {
    CategoryModel categoryModel  = await _repository.fetchAllCategory();
    _categoryFetcher.sink.add(categoryModel);
  }

  fetchAllProducts() async {
    ProductModel productModel  = await _repository.fetchAllProducts();
    _productFetcher.sink.add(productModel);
  }

  dispose() {
    _offerFetcher.close();
    _categoryFetcher.close();
    _productFetcher.close();

  }
}

final bloc = HomeBloc();
