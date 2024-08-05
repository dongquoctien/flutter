import 'package:coffee/common/controller/base_controller.dart';
import 'package:coffee/data/model/home/category/category.dart';
import 'package:coffee/repository/home/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
    with StateMixin<List<Category>>, BaseController {
  final CategoryRepository categoryRepository;

  CategoryController({required this.categoryRepository});

  Future<void> getCategories() async {
    change(null, status: RxStatus.loading());
    Either<String, List<Category>> failureOrSuccess =
        (await categoryRepository.getCategories());

    failureOrSuccess.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (List<Category> categories) {
        if (categories.isBlank == true) {
          change(null, status: RxStatus.empty());
        } else {
          change(categories, status: RxStatus.success());
        }
      },
    );
  }
}
