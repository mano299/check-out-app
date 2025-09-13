import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/check_out/presentation/widget/custom_card_info_item.dart';
import 'package:flutter/material.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
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
          ],
        ),
      ),
    );
  }
}
