import 'package:coffee/common/network/api_helper.dart';
import 'package:coffee/common/network/dio_client.dart';
import 'package:coffee/data/model/product/product.dart';
import 'package:coffee/core/api_config.dart';

class ProductApi with ApiHelper<Product> {
  final DioClient dioClient;

  ProductApi({required this.dioClient});

  Future<Product> getProducts(
      {int? pageNumber, int? pageSize, String? slug}) async {
    Map<String, dynamic> queryParameters = <String, dynamic>{};

    if (pageNumber != null && pageNumber > 0) {
      queryParameters.addAll({'pageSize': pageSize});
    }

    if (pageNumber != null && pageNumber > 0) {
      queryParameters.addAll({'pageNumber': pageSize});
    }
    queryParameters.addAll({'pageNumber': pageNumber});
    if (slug != null && slug != "") {
      queryParameters.addAll({'slug': pageSize});
    }

    return await coffeeMakeGetRequest(
        dioClient.dio
            .get(ApiConfig.getProducts, queryParameters: queryParameters),
        Product.fromJson);
  }
}
