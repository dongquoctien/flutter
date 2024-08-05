import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:coffee/common/network/dio_exception.dart';

mixin RepositoryHelper<T> {
  Future<Either<String, bool>> checkItemFailOrSuccess(
    Future<bool> apiCallback,
  ) async {
    try {
      await apiCallback;
      return const Right(true);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(errorMessage);
    }
  }

  // for coffee
  Future<Either<String, List<T>>> checkDataListResponse(
    Future<List<T>> apiCallback,
  ) async {
    try {
      final List<T> items = await apiCallback;
      return Right(items);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(errorMessage);
    }
  }

  Future<Either<String, T>> checkDataResponse(
    Future<T> apiCallback,
  ) async {
    try {
      final T item = await apiCallback;
      return Right(item);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return Left(errorMessage);
    }
  }
}
