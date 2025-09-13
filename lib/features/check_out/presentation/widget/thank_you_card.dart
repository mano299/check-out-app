import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/check_out/presentation/widget/custom_card_info_item.dart';
import 'package:check_out_app/features/check_out/presentation/widget/total_price.dart';
import 'package:flutter/material.dart';

import 'custom_credit_card.dart';
import 'success_pay.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: Text(
                'Thank you!',
                style: Styles.styleMedium25,
              ),
            ),
            Text(
              'Your transaction was successful',
              style: Styles.styleRegular20,
            ),
            SizedBox(height: 42),
            CustomCardInfoItem(
              title: 'Date',
              value: '01/24/2023',
            ),
            SizedBox(height: 20),
            CustomCardInfoItem(
              title: 'Time',
              value: '10:15 AM',
            ),
            SizedBox(height: 20),
            CustomCardInfoItem(
              title: 'To',
              value: 'Sam Louis',
            ),
            Divider(
              color: Color(0xffC7C7C7),
              thickness: 2,
              height: 60,
            ),
            TotalPrice(),
            SizedBox(height: 30),
            CustomCreditCard(),
            Spacer(),
            SuccessPay(),
            SizedBox(height: (MediaQuery.sizeOf(context).height * .2 / 2) - 29)
          ],
        ),
      ),
    );
  }
}
