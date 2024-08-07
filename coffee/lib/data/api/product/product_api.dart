import 'package:coffee/common/network/api_helper.dart';
import 'package:coffee/common/network/dio_client.dart';
import 'package:coffee/data/model/product/product.dart';
import 'package:coffee/core/api_config.dart';

class ProductApi with ApiHelper<Product> {
  final DioClient dioClient;

  ProductApi({required this.dioClient});

  Future<Product> getProducts(
      {int? pageNumber, int? pageSize, String? slug, int? storeCode}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (pageSize != null) {
      queryParameters.addAll({'pageSize': pageSize.toString()});
    }
    if (pageNumber != null) {
      queryParameters.addAll({'pageNumber': pageNumber.toString()});
    }
    if (slug != null) {
      queryParameters.addAll({'slug': slug});
    }
    if (storeCode != null) {
      queryParameters.addAll({'storeCode': storeCode.toString()});
    }

    return await coffeeMakeGetRequest(
        dioClient.dio
            .get(ApiConfig.getProducts, queryParameters: queryParameters),
        Product.fromJson);
  }
}
