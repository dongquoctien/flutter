import 'package:coffee/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as html_parser;

class ProductCardItem extends StatefulWidget {
  const ProductCardItem({super.key});
  // final ProductItem productItem;

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
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
                    "https://hcm.fstorage.vn/images/2024/07/man-do-20240724044039.png",
                    height: 140,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.red,
                    child: Text(
                      extractTextFromHtml("<p>Lục Bảo Tân Cương - Mới</p>"),
                      style: const TextStyle(color: Colors.white),
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
                const SizedBox(height: 8,),
                const Padding(
                  padding:
                      EdgeInsets.only( left: 8, right: 8),
                  child: Text(
                    "Lục Trà Tân Cương Mận Đỏ (L)",
                    style: TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        color: appColorPrimary,
                        // fontWeight: FontWeight.w600
                        ),
                  ),
                ),
                const Row(
                  
                  children: [
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Text(
                        "65.000 đ",
                        style: TextStyle(
                          fontSize: 16,
                          color: appColorPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                                           ),
                     ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
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
