import 'dart:async';

import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/resources/repositry.dart';

class HomeBloc {
  final _repository = Repository();
  final _offerFetcher = PublishSubject<List<OfferModel>>();
  final _categoryFetcher = PublishSubject<List<CategoryModel>>();

  Stream<List<OfferModel>> get allOffers => _offerFetcher.stream;
  Stream<List<CategoryModel>> get allCategory => _categoryFetcher.stream;

  fetchAllOffers() async {
    List<OfferModel> offerModelList = await _repository.fetchAllOffers();
    _offerFetcher.sink.add(offerModelList);
  }

  fetchAllCategories() async {
    List<CategoryModel> categoryModel = await _repository.fetchAllCategory();
    _categoryFetcher.sink.add(categoryModel);
  }

  dispose() {
    _offerFetcher.close();
    _categoryFetcher.close();
  }
}
