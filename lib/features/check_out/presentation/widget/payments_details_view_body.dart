import 'package:flutter/material.dart';

import 'payment_card.dart';
import 'payment_methods_list_view.dart';

class PaymentsDetailsViewBody extends StatelessWidget {
  const PaymentsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaymentMethodsListView(),
          PaymentCard(),
        ],
      ),
    );
  }
}
