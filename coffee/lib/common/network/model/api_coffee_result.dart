import 'package:freezed_annotation/freezed_annotation.dart';

import 'paging.dart';

@immutable
class ApiCoffeeResult<T> {
  final String? code;
  final String? message;
  final T? data;
  final Paging? paging;

  const ApiCoffeeResult({this.code, this.message, this.data, this.paging});

  @override
  String toString() {
    return 'ApiCoffeeResult(code: $code, message: $message, data: $data, paging: $paging)';
  }

  factory ApiCoffeeResult.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiCoffeeResult(
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : fromJsonT(json['data'] as Map<String, dynamic>),
      paging: json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) toJsonT) => {
        'code': code,
        'message': message,
        'data': toJsonT(data),
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
