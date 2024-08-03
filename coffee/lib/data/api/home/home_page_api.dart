import 'package:coffee/common/network/api_helper.dart';
import 'package:coffee/common/network/dio_client.dart';
import 'package:coffee/core/api_config.dart';
import 'package:coffee/data/model/home/home_page/home_page.dart';

class HomePageApi with ApiHelper<HomePage> {
  final DioClient dioClient;

  HomePageApi({required this.dioClient});

  Future<HomePage> getHomePage() async {
    return await makeGetRequestInfo(
        dioClient.dio.get(ApiConfig.homePages), HomePage.fromJson);
  }
}
