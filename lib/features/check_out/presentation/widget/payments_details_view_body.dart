import 'package:flutter/material.dart';

import 'payment_methods_list_view.dart';

class PaymentsDetailsViewBody extends StatelessWidget {
  const PaymentsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethodsListView(),
      ],
    );
  }
}
