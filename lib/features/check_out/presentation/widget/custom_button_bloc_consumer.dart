import 'dart:developer';

import 'package:check_out_app/core/functions/excute_stripe_payment.dart';
import 'package:check_out_app/features/check_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:check_out_app/features/check_out/presentation/views/thank_you_view.dart';
import 'package:check_out_app/features/check_out/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/excute_paypal_payment.dart';
import '../../../../core/functions/get_transaction_data.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ThankYouView(),
              ));
        } else if (state is PaymentFailure) {
          log(state.errMessage);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (isPaypal) {
              var tranactionData = getTransactionsData();
              excutePayPalPayment(context, tranactionData);
            } else {
              excuteStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Select',
          color: Color(0xff34A853),
        );
      },
    );
  }
}
