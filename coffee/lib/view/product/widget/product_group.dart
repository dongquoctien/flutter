import 'package:coffee/core/app_style.dart';
import 'package:flutter/material.dart';

class ProductGroup extends StatelessWidget {
  const ProductGroup({super.key, required this.nameGroup});

  final String nameGroup;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            Text(
              nameGroup,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: appColorPrimary),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                print('$nameGroup -> onClickDetail');
              },
              child: const Text(
                "See more",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: appColorPrimary,
                    fontSize: 14,
                    decoration: TextDecoration.underline),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                ">",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: appColorPrimary,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
