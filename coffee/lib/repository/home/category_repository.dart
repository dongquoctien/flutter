import 'package:coffee/common/repository/repository_helper.dart';
import 'package:coffee/data/api/home/category_api.dart';
import 'package:coffee/data/model/home/category/category.dart';
import 'package:dartz/dartz.dart';

class CategoryRepository with RepositoryHelper<Category> {
  final CategoryApi categoryApi;

  CategoryRepository({required this.categoryApi});

  Future<Either<String, List<Category>>> getCategories() async {
    return checkDataListResponse(categoryApi.getCategories());
  }

}
