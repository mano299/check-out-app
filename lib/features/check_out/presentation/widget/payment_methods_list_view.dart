import 'package:check_out_app/features/check_out/presentation/widget/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});
  final List<String> paymentMethodsItems = const [
    'assets/images/mastercard.svg',
    'assets/images/paypal.svg',
    'assets/images/applepay.svg'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PaymentMethod(
              isAcitve: false,
              image: paymentMethodsItems[index],
            ),
          );
        },
      ),
    );
  }
}
