import 'dart:async';

import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/loginModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';

import 'api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();
  // Banner  Api
  Future<List<OfferModel>> fetchAllOffers() => apiProvider.fetchOfferList();
  // Category Api
  Future<List<CategoryModel>> fetchAllCategory() =>
      apiProvider.fetchCategoryList();
  // Product Api
  Future<List<ProductModel>> fetchAllProducts(String categoryId) =>
      apiProvider.fetchProductList(categoryId);
  // Cart Api
  Future<List<CartModel>> fetchAllCartProducts() => apiProvider.fetchCartList();
  //Add to Cart Api
  Future<List<CartModel>> cartProductAdd(CartModel productInfo) =>
      apiProvider.fetchCartByAdd(productInfo);
  // Delete Cart Api
  Future<List<CartModel>> cartProductDelete(String productId) =>
      apiProvider.fetchCartByDelete(productId);
  // Clear Cart Api
  Future<List<CartModel>> cartClear() => apiProvider.clearCart();
  // Login API
  Future<LoginModel> hitLogin(Map<String, String> params) =>
      apiProvider.hitLogin(params);
  // Signup API
  Future<LoginModel> hitSignup(Map<String, dynamic> params) =>
      apiProvider.hitSignup(params);

}
