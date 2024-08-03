import 'package:coffee/common/controller/base_controller.dart';
import 'package:coffee/data/model/home/home_page/home_page.dart';
import 'package:coffee/repository/home/home_page_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController
    with StateMixin<HomePage>, BaseController {
  final HomePageRepository homePageRepository;
  Rx<HomePage?> homePage = Rx<HomePage?>(null);

  HomePageController({required this.homePageRepository});

  
  Future<void> getUserList() async {
    change(null, status: RxStatus.loading());
    Either<String, HomePage> failureOrSuccess =
        (await homePageRepository.getHomePage());

    failureOrSuccess.fold(
      (String failure) {
        change(null, status: RxStatus.error(failure));
      },
      (HomePage homePage) {
        if (homePage.isBlank ==true) {
          change(null, status: RxStatus.empty());
        } else {
          homePage = homePage;
          change(homePage, status: RxStatus.success());
        }
      },
    );
  }
}
