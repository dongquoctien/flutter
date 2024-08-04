import 'package:coffee/common/network/api_helper.dart';
import 'package:coffee/common/network/dio_client.dart';
import 'package:coffee/core/api_config.dart';
import 'package:coffee/data/model/home/category/category.dart';

class CategoryApi with ApiHelper<Category> {
  final DioClient dioClient;

  CategoryApi({required this.dioClient});

  Future<List<Category>> getCategories() async {
    return await coffeeMakeGetRequestToList(
        dioClient.dio.get(ApiConfig.categories), Category.fromJson);
  }

}
