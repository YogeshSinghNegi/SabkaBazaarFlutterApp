import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
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
  // Future<TrailerModel> fetchTrailer(int movieId) async {
  //   final response =
  //   await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");
  //
  //   if (response.statusCode == 200) {
  //     return TrailerModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load trailers');
  //   }
  // }
}
