import 'package:coffee/common/dialog/retry_dialog.dart';
import 'package:coffee/common/widget/empty_widget.dart';
import 'package:coffee/common/widget/spinkit_indicator.dart';
import 'package:coffee/core/app_asset.dart';
import 'package:coffee/core/app_style.dart';
import 'package:coffee/data/model/home/home_page/header_banner.dart';
import 'package:coffee/data/model/home/home_page/home_page.dart';
import 'package:coffee/di.dart';
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

  Widget searchWidget(HomePage? homePage) {
    
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(
                  color: appColorGray,
                  width: 1.0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              hintStyle: TextStyle(color: Color.fromRGBO(171, 171, 171, 1)),
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
                child: Text(
                  "Delivery",
                  style: TextStyle(
                      fontSize: 18,
                      color: appColorPrimary,
                      fontWeight: FontWeight.bold),
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
         
        ],
      ),
    );
  }

  Widget bannerList(List<HeaderBanner> headerBanners) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        viewportFraction: 1,
      ),
      items: headerBanners
          .map((item) =>
              Center(child: Image.network(item.imageUrl!, fit: BoxFit.cover)))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _homeController.obx(
      (state) => Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: appBar(state),
        body: searchWidget(state),
      ),
      onLoading: const SpinKitIndicator(type: SpinKitType.circle),
      onError: (error) => RetryDialog(
        title: "$error",
        onRetryPressed: () => _homeController.getUserList(),
      ),
      onEmpty: const EmptyWidget(message: "Page not found"),
    );
  }

  @override
  void initState() {
    print('HomePage -> initState');
    _homeController.getUserList();
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
