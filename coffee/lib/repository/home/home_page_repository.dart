
import 'package:coffee/common/repository/repository_helper.dart';
import 'package:coffee/data/api/home/home_page_api.dart';
import 'package:coffee/data/model/home/home_page/home_page.dart';
import 'package:dartz/dartz.dart';

class HomePageRepository with RepositoryHelper<HomePage> {
  final HomePageApi homePageApi;

  HomePageRepository({required this.homePageApi});

   Future<Either<String, HomePage>> getHomePage() async {
    return checkDataFailOrSuccess(homePageApi.getHomePage());
  }
}