import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:sabka_bazar_flutter_app/src/Model/cartModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/loginModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://sabaka-bazzar.azurewebsites.net/sabakabazzar";


  Future<List<OfferModel>> fetchOfferList() async {
    Response response;
    if (_baseUrl != "") {
      response = await client.get(Uri.parse("$_baseUrl/banners"));
    } else {
      throw Exception('Please add your BaseUrl');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var tagObjJson = jsonDecode(response.body) as List;
      List<OfferModel> tagObs =
          tagObjJson.map((tagJson) => OfferModel.fromJson(tagJson)).toList();
      return tagObs;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<CategoryModel>> fetchCategoryList() async {
    Response response;
    if (_baseUrl != "") {
      response = await client.get(Uri.parse("$_baseUrl/categories"));
    } else {
      throw Exception('Please add your BaseUrl');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var tagObjJson = jsonDecode(response.body) as List;
      List<CategoryModel> tagObs =
          tagObjJson.map((tagJson) => CategoryModel.fromJson(tagJson)).toList();
      return tagObs;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<ProductModel>> fetchProductList(String categoryId) async {
    Response response;
    if (_baseUrl != "") {
      final params = {'categoryId': categoryId};
      final String queryString = Uri(queryParameters: params).query;
      final String uriString = "$_baseUrl/products/" + '?' + queryString;
      response = await client.get(Uri.parse(uriString));
    } else {
      throw Exception('Please add your BaseUrl');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var tagObjJson = jsonDecode(response.body) as List;
      List<ProductModel> tagObs =
          tagObjJson.map((tagJson) => ProductModel.fromJson(tagJson)).toList();
      return tagObs;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<CartModel>> fetchCartList() async {
    Response response;
    if (_baseUrl != "") {
      response = await client.get(Uri.parse("$_baseUrl/cart/items"));
    } else {
      throw Exception('Please add your BaseUrl');
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var tagObjJson = jsonDecode(response.body) as List;
      List<CartModel> tagObs =
          tagObjJson.map((tagJson) => CartModel.fromJson(tagJson)).toList();
      return tagObs;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<CartModel>> fetchCartByAdd(CartModel productInfo) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'ARRAffinity=22a7daa836b64a8ce56c907737553d08297ff2e76cd06a1f52c29956b9a85c17; ARRAffinitySameSite=22a7daa836b64a8ce56c907737553d08297ff2e76cd06a1f52c29956b9a85c17'
    };
    var body = json.encode(productInfo.toJson());
    print("------------------");
    print(body);
    print("------------------");
    final response = await client.post(Uri.parse("$_baseUrl/cart/addToCart"),
        headers: headers, body: body);

    if (response.statusCode == 200) {
      var tagObjJson = jsonDecode(response.body) as List;
      List<CartModel> tagObs =
          tagObjJson.map((tagJson) => CartModel.fromJson(tagJson)).toList();
      return tagObs;
    } else {
      throw Exception('Failed add product to cart');
    }
  }

  Future<List<CartModel>> fetchCartByDelete(String productId) async {
    final response = await client
        .delete(Uri.parse("$_baseUrl/cart/deleteToCart?productId=$productId"));

    if (response.statusCode == 200) {
      var tagObjJson = jsonDecode(response.body) as List;
      List<CartModel> tagObs =
          tagObjJson.map((tagJson) => CartModel.fromJson(tagJson)).toList();
      return tagObs;
    } else {
      throw Exception('Failed delete  product to cart');
    }
  }

  Future<List<CartModel>> clearCart() async {
    final response = await client
        .delete(Uri.parse("$_baseUrl/cart/clearCart"));

    if (response.statusCode == 200) {
      return [];
    } else {
      throw Exception('Failed delete  product to cart');
    }
  }
  
  Future<LoginModel> hitLogin(Map<String, String> params) async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie':
          'ARRAffinity=22a7daa836b64a8ce56c907737553d08297ff2e76cd06a1f52c29956b9a85c17; ARRAffinitySameSite=22a7daa836b64a8ce56c907737553d08297ff2e76cd06a1f52c29956b9a85c17'
    };

    final String queryString = Uri(queryParameters: params).query;
    final String uriString = "$_baseUrl/users/login/" + '?' + queryString;
    final response = await client.post(Uri.parse(uriString), headers: headers);

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      return LoginModel(
        response: 'Login failed',
        responseMessage: 'Internal Server Error',
        cartCount: 0,
      );

    }
  }
}
