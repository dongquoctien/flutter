import 'package:coffee/common/repository/repository_helper.dart';
import 'package:coffee/data/api/product/product_api.dart';
import 'package:coffee/data/model/product/product.dart';
import 'package:dartz/dartz.dart';

class ProductRepository with RepositoryHelper<Product> {
  final ProductApi productApi;

  ProductRepository({required this.productApi});

  Future<Either<String, Product>> getProducts(
      {int? pageNumber, int? pageSize, String? slug}) async {
    return checkDataResponse(productApi.getProducts(
        pageNumber: pageSize, pageSize: pageSize, slug: slug));
  }

}
