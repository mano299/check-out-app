import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xff34A853),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff34A853),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset('assets/images/mastercard.svg'),
      ),
    );
  }
}
