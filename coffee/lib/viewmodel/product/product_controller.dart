import 'package:coffee/common/controller/base_controller.dart';
import 'package:coffee/data/model/product/product.dart';
import 'package:coffee/repository/product/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
    with StateMixin<Product>, BaseController {
  final ProductRepository productRepository;

  ProductController({required this.productRepository});

  Future<void> getProducts({
    int? pageNumber =1,
    int? pageSize =4,
    String? slug ="san pham noi bat",

  }) async {
    change(null, status: RxStatus.loading());
    Either<String, Product> failureOrSuccess =
        (await productRepository.getProducts(pageNumber: pageNumber, pageSize: pageSize, slug: slug));

    failureOrSuccess.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (Product product) {
        if (product.isBlank ==true) {
          change(null, status: RxStatus.empty());
        } else {
          change(product, status: RxStatus.success());
        }
      },
    );
  }
}
