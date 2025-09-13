import 'package:check_out_app/features/check_out/presentation/widget/custom_button.dart';
import 'package:check_out_app/features/check_out/presentation/widget/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodsListView(),
          SizedBox(height: 32),
          CustomButton(
            text: 'Select',
            color: Color(0xff34A853),
          ),
        ],
      ),
    );
  }
}
