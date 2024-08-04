import 'dart:io';

import 'package:coffee/common/network/dio_exception.dart';
import 'package:coffee/common/network/model/api_coffee_result.dart';
import 'package:coffee/core/app_extension.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

abstract mixin class ApiHelper<T> {
  late final T data;

  Future<bool> _requestMethodTemplate(
      Future<Response<dynamic>> apiCallback) async {
    final Response response = await apiCallback;
    if (response.statusCode.success) {
      return true;
    } else {
      throw DioExceptions;
    }
  }

  //Generic method template for create item on server
  Future<bool> makePostRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for update item on server
  Future<bool> makePutRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for delete item from server
  Future<bool> makeDeleteRequest(Future<Response<dynamic>> apiCallback) async {
    return _requestMethodTemplate(apiCallback);
  }

  //Generic method template for getting data from Api
  Future<List<T>> makeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    final List<T> items = List<T>.from(
      json
          .decode(json.encode(response.data))
          .map((item) => getJsonCallback(item)),
    );
    if (response.statusCode.success) {
      return items;
    } else {
      throw DioExceptions;
    }
  }

  Future<List<T>> coffeeMakeGetRequestToList(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;
    print("json.decode(json.encode(response.data))");
    print(json.decode(json.encode(response.data)));

    final apiCoffeeResult = ApiCoffeeResult.fromJsonList(
        json.decode(json.encode(response.data)),
        getJsonCallback
    );
    print("coffeeMakeGetRequestToList");
    if (response.statusCode.success) {
      return apiCoffeeResult.dataList ?? [];
    } else {
      throw DioExceptions;
    }
  }

  Future<T> coffeeMakeGetRequest(Future<Response<dynamic>> apiCallback,
      T Function(Map<String, dynamic> json) getJsonCallback) async {
    final Response response = await apiCallback;

    final apiCoffeeResult = ApiCoffeeResult.fromJson(
      json.decode(json.encode(response.data)),
      getJsonCallback,
    );
    if (response.statusCode.success) {
      return apiCoffeeResult.data ?? null as T;
    } else {
      throw DioExceptions;
    }
  }
}
