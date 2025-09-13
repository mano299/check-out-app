import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCreditCard extends StatelessWidget {
  const CustomCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/master.svg'),
          SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Card',
                style: Styles.styleRegular18,
              ),
              Text(
                'Mastercard **78',
                style: Styles.styleRegular18.copyWith(
                    fontSize: 16, color: Color(0xff000000).withOpacity(0.7)),
              )
            ],
          )
        ],
      ),
    );
  }
}
