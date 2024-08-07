import 'package:coffee/core/app_style.dart';
import 'package:coffee/data/model/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';

class ProductCardItem extends StatefulWidget {
  const ProductCardItem({super.key, required this.productItem});
  final ProductItem productItem;

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  var formartCurrency = NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: appColorGray,
            width: double.infinity,
            height: 240,
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    widget.productItem.mediaUrl ?? "",
                    height: 140,
                  ),
                ),
                Visibility(
                  visible:
                      extractTextFromHtml(widget.productItem.shortDesc ?? "") !=
                          "",
                  child: Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      color: Colors.red,
                      child: Text(
                        // widget.productItem.shortDesc ?? "",
                        extractTextFromHtml(widget.productItem.shortDesc ?? ""),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    widget.productItem.subName ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: appColorPrimary,
                      // fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${formartCurrency.format(widget.productItem.price ?? 0)} đ',
                        style: const TextStyle(
                          fontSize: 16,
                          color: appColorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 8.0, left: 8.0, right: 8.0),
                    child: ElevatedButton(
                      onPressed: () => print("onBuy"),
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(appColorPrimary)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            color: appTextColorPrimary,
                          ),
                          Text(
                            "Buy now",
                            style: TextStyle(
                                color: appTextColorPrimary, fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String extractTextFromHtml(String htmlString) {
    // Parse the HTML string
    dom.Document document = html_parser.parse(htmlString);
    // Extract the text content from the parsed HTML
    String text = document.body?.text ?? '';
    return text;
  }
}
