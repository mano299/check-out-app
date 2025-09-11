import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.isAcitve, required this.image});
  final bool isAcitve;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 62,
      width: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isAcitve ? Color(0xff34A853) : Color(0xff808080),
          width: isAcitve ? 2 : 1.5,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: isAcitve
            ? [
                BoxShadow(
                  color: Color(0xff34A853),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: Center(
        child: SvgPicture.asset(image),
      ),
    );
  }
}
