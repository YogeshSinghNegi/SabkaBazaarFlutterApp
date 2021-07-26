import 'dart:async';

import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<List<OfferModel>> fetchAllOffers() => apiProvider.fetchOfferList();
  Future<List<CategoryModel>> fetchAllCategory() =>
      apiProvider.fetchCategoryList();
  Future<List<ProductModel>> fetchAllProducts(String categoryId) =>
      apiProvider.fetchProductList(categoryId);

  //Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
