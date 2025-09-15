import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/check_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void excuteStripePayment(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '50',
    currency: 'USD',
    customerID: ApiKeys.customerID,
  );
  BlocProvider.of<PaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
