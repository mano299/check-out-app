import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';


class CustomCardInfoItem extends StatelessWidget {
  const CustomCardInfoItem(
      {super.key, required this.title, required this.value});

  final String title, value;
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
          value,
          style: Styles.styleSemiBold18,
        ),
      ],
    );
  }
}
