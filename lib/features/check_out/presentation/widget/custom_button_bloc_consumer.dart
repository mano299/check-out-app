import 'dart:developer';

import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/features/check_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:check_out_app/features/check_out/presentation/views/thank_you_view.dart';
import 'package:check_out_app/features/check_out/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../data/models/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        // if (state is PaymentSuccess) {
        //   Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => ThankYouView(),
        //       ));
        // } else if (state is PaymentFailure) {
        //   log(state.errMessage);
        //   SnackBar snackBar = SnackBar(content: Text(state.errMessage));
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }

        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: "",
            secretKey: "",
            transactions: const [
              {
                "amount": {
                  "total": "70",
                  "currency": "USD",
                  "details": {
                    "subtotal": "70",
                    "shipping": "0",
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                "item_list": {
                  "items": [
                    {
                      "name": "Apple",
                      "quantity": 4,
                      "price": "5",
                      "currency": "USD"
                    },
                    {
                      "name": "Pineapple",
                      "quantity": 5,
                      "price": "10",
                      "currency": "USD"
                    }
                  ],

                  // shipping address is not required though
                  //   "shipping_address": {
                  //     "recipient_name": "tharwat",
                  //     "line1": "Alexandria",
                  //     "line2": "",
                  //     "city": "Alexandria",
                  //     "country_code": "EG",
                  //     "postal_code": "21505",
                  //     "phone": "+00000000",
                  //     "state": "Alexandria"
                  //  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
            },
            onError: (error) {
              print("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              print('cancelled:');
            },
          ),
        ));
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
