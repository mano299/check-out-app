import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.price});
  final String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.styleRegular18,
        ),
        Spacer(),
        Text(
          "\$$price",
          style: Styles.styleRegular18,
        )
      ],
    );
  }
}
