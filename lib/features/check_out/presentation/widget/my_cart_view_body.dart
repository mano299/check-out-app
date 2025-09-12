import 'package:check_out_app/features/check_out/presentation/widget/custom_button.dart';
import 'package:check_out_app/features/check_out/presentation/widget/total_price.dart';
import 'package:flutter/material.dart';

import '../views/payments_details_view.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          Expanded(child: Image.asset('assets/images/cart.png')),
          SizedBox(height: 25),
          OrderInfoItem(
            title: 'Order Subtotal',
            price: '42.97',
          ),
          SizedBox(height: 3),
          OrderInfoItem(
            title: 'Discount',
            price: '0',
          ),
          SizedBox(height: 3),
          OrderInfoItem(
            title: 'Shipping',
            price: '8',
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              thickness: 2,
              color: Color(0xffC7C7C7),
              height: 30,
            ),
          ),
          TotalPrice(),
          SizedBox(height: 16),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentsDetailsView(),
                ),
              );
            },
            text: 'Complete Payment',
            color: Color(0xff34A853),
          ),
          SizedBox(height: 12)
        ],
      ),
    );
  }
}
