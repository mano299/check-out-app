import 'package:check_out_app/features/check_out/presentation/widget/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentsDetailsViewBody extends StatelessWidget {
  const PaymentsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentMethod(isAcitve: false),
      ],
    );
  }
}
