import 'dart:developer';

import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/features/check_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:check_out_app/features/check_out/presentation/views/thank_you_view.dart';
import 'package:check_out_app/features/check_out/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
              customerID: ApiKeys.customerID,
            );
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Select',
          color: Color(0xff34A853),
        );
      },
    );
  }
}
