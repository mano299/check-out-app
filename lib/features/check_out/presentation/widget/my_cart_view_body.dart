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
          SizedBox(height: 25),
          Image.asset('assets/images/cart.png'),
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
        ],
      ),
    );
  }
}
