import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccessPay extends StatelessWidget {
  const SuccessPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          FontAwesomeIcons.barcode,
          size: 86,
        ),
        Container(
          width: 113,
          height: 58,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff34A853),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'PAID',
              style: Styles.styleSemiBold24.copyWith(color: Color(0xff34A853)),
            ),
          ),
        ),
      ],
    );
  }
}
