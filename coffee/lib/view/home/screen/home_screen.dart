import 'package:coffee/common/dialog/retry_dialog.dart';
import 'package:coffee/common/widget/empty_widget.dart';
import 'package:coffee/common/widget/spinkit_indicator.dart';
import 'package:coffee/core/app_asset.dart';
import 'package:coffee/core/app_style.dart';
import 'package:coffee/data/model/home/home_page/header_banner.dart';
import 'package:coffee/data/model/home/home_page/home_page.dart';
import 'package:coffee/di.dart';
import 'package:coffee/view/home/widget/category_item.dart';
import 'package:coffee/viewmodel/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomePageController _homeController = getIt<HomePageController>();

  Widget get floatingActionButton {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        backgroundColor: appColorPrimary,
        onPressed: () async {
          print("onPressed -> FloatingActionButton");
        },
        child: const Badge(
          label: Text('3'),
          child: Icon(
            Icons.add_shopping_cart_outlined,
            color: appTextColorPrimary,
          ),
        ),
      ),
    );
  }

  PreferredSize appBar(HomePage? homePage) {
    return PreferredSize(
        preferredSize:
            const Size.fromHeight(100), // change height of ads as you like
        child: Container(child: bannerList(homePage?.headerBanner ?? [])));
  }

  Widget bannerList(List<HeaderBanner> headerBanners) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: headerBanners
          .map((item) => Center(
              child: Image.network(item.imageUrl!,
                  width: MediaQuery.of(context).size.width, fit: BoxFit.cover)))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.obx(
      (state) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: floatingActionButton,
          appBar: appBar(state),
          body: const Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(171, 171, 171, 1)),
                    hintText: "What would you like to drink today?",
                    fillColor: appColorGray,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image(image: AssetImage(AppAsset.delivery), height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery",
                            style: TextStyle(
                                fontSize: 18,
                                color: appColorPrimary,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "AEON Bình Dương P. Bình Hòa TP. Thuận An T...",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  child: Divider(
                    color: appColorGray,
                    height: 5,
                  ),
                ),
                CategoryItem(),
              ],
            ),
          ),
        );
      },
      onLoading: const SpinKitIndicator(type: SpinKitType.circle),
      onError: (error) => RetryDialog(
        title: "$error",
        onRetryPressed: () => _homeController.getHomePages(),
      ),
      onEmpty: const EmptyWidget(message: "Page not found"),
    );
  }

  @override
  void initState() {
    print('HomePage -> initState');

    _homeController.getHomePages();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('HomePage -> didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('HomePage -> didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }
}
