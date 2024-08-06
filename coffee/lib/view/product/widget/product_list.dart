import 'package:coffee/common/dialog/retry_dialog.dart';
import 'package:coffee/common/widget/empty_widget.dart';
import 'package:coffee/data/model/product/product_item.dart';
import 'package:coffee/di.dart';
import 'package:coffee/view/product/widget/product_card_item.dart';
import 'package:coffee/viewmodel/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductController _productController = getIt<ProductController>();

  @override
  Widget build(BuildContext context) {
    return _productController.obx(
      (state) {
        print(state);
        return generateProductItem(state?.items ?? []);
      },
      onError: (error) => RetryDialog(
        title: "$error",
        onRetryPressed: () => _productController.getProducts(),
      ),
      onEmpty: const EmptyWidget(message: "No data"),
    );
  }

  Widget generateProductItem(List<ProductItem> productItems) {
    print("generateProductItem" + productItems.length.toString());
    print(productItems);
    final children = <Widget>[];
    for (var i = 1; i <= productItems.length; i++) {
      if (i % 2 == 0) {
        if(productItems.length - i ==1) {
          children.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: ProductCardItem(productItem: productItems[i-1])),
          ],
        ));
        }
        else {
          children.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: ProductCardItem(productItem: productItems[i-2],)),
            Expanded(child: ProductCardItem(productItem: productItems[i-1])),
          ],
        ));
        }
       
      }
    }

    return Column(children: children);
  }

  @override
  void initState() {
    _productController.getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}
