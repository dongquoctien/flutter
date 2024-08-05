import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'paging.dart';

@immutable
class ApiCoffeeResult<T> {
  final String? code;
  final String? message;
  final T? data;
  final List<T>? dataList;
  final Paging? paging;

  const ApiCoffeeResult(
      {this.code, this.message, this.data, this.dataList, this.paging});

  @override
  String toString() {
    return 'ApiCoffeeResult(code: $code, message: $message, data: $data, paging: $paging)';
  }

  factory ApiCoffeeResult.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return ApiCoffeeResult(
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : fromJson(json['data'] as Map<String, dynamic>),
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );
  }

  factory ApiCoffeeResult.fromJsonList(
      Map<String, dynamic> _json, T Function(Map<String, dynamic>) fromJson) {
    return ApiCoffeeResult(
      code: _json['code'] as String?,
      message: _json['message'] as String?,
      data: null,
      dataList: _json['data'] == null
          ? null
          : List<T>.from(json
              .decode(json.encode(_json["data"]))
              .map((item) => fromJson(item))),
      paging: _json['paging'] == null
          ? null
          : Paging.fromJson(_json['paging'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) toJson) => {
        'code': code,
        'message': message,
        'data': toJson(data),
        'paging': paging?.toJson(),
      };

  ApiCoffeeResult copyWith({
    String? code,
    String? message,
    T? data,
    Paging? paging,
  }) {
    return ApiCoffeeResult(
      code: code ?? this.code,
      message: message ?? this.message,
      data: data ?? this.data,
      paging: paging ?? this.paging,
    );
  }
}
