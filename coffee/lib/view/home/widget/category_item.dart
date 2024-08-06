import 'package:coffee/core/app_style.dart';
import 'package:coffee/data/model/home/category/category.dart';
import 'package:coffee/di.dart';
import 'package:coffee/viewmodel/home/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final CategoryController _categoryController = getIt<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return _categoryController.obx(
      (state) {
        var categoryItems = state ?? [];
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          height: 100,
          child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: [
                for (Category item in categoryItems)
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          item.imageUrl ?? "",
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            item.name ?? "",
                            style: const TextStyle(
                                fontSize: 16,
                                color: appColorPrimary,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
              ]
              ),
        );
      },
    );
  }

  @override
  void initState() {
    _categoryController.getCategories();

    super.initState();
  }
}
