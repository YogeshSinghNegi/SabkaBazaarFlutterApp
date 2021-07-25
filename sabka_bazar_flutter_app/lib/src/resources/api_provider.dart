import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/productModel.dart';

class ApiProvider {
  Client client = Client();
  final _apiKey = 'api-key';
  final _baseUrl = "https://sabaka-bazzar.azurewebsites.net/sabakabazzar/";

  Future<OfferModel> fetchOfferList() async {
    Response response;
    if(_apiKey != 'api-key') {
      response = await client.get("$_baseUrl/banners");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return OfferModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<CategoryModel> fetchCategoryList() async {
    Response response;
    if(_apiKey != 'api-key') {
      response = await client.get("$_baseUrl/categories");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return CategoryModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  Future<ProductModel> fetchProductList() async {
    Response response;
    if(_apiKey != 'api-key') {
      response = await client.get("$_baseUrl/products");
    }else{
      throw Exception('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ProductModel.fromJson(json.decode(response.body));
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
