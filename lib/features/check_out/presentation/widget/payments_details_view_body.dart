import 'package:check_out_app/features/check_out/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';

import 'payment_card.dart';
import 'payment_methods_list_view.dart';

class PaymentsDetailsViewBody extends StatefulWidget {
  const PaymentsDetailsViewBody({super.key});

  @override
  State<PaymentsDetailsViewBody> createState() =>
      _PaymentsDetailsViewBodyState();
}

class _PaymentsDetailsViewBodyState extends State<PaymentsDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverToBoxAdapter(
          child: PaymentCard(
            formKey: formKey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 16, right: 16),
              child: CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Pay',
                color: Color(0xff34A853),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
