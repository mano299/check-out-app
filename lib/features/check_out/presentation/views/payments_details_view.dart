import 'package:check_out_app/features/check_out/presentation/widget/build_app_bar.dart';
import 'package:check_out_app/features/check_out/presentation/widget/payments_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentsDetailsView extends StatelessWidget {
  const PaymentsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'Payments Details', context: context),
      body: PaymentsDetailsViewBody(),
    );
  }
}
