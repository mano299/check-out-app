import 'package:flutter/material.dart';

import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 18),
          Image.asset('assets/images/cart.png'),
          SizedBox(height: 25),
          OrderInfoItem(
            title: 'Order Subtotal',
            price: '42.97',
          ),
          OrderInfoItem(
            title: 'Discount',
            price: '0',
          ),
          OrderInfoItem(
            title: 'Shipping',
            price: '8',
          ),
        ],
      ),
    );
  }
}
