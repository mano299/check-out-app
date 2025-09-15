import 'dart:developer';

import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/features/check_out/data/models/amount_model/amount_model.dart';
import 'package:check_out_app/features/check_out/data/models/amount_model/details.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/item.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/orders_model.dart';
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
        var tranactionData = getTransactionsData();
        excutePayPalPayment(context, tranactionData);
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

  void excutePayPalPayment(BuildContext context,
      ({AmountModel amount, OrdersModel ordersList}) tranactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "",
        secretKey: "",
        transactions: [
          {
            "amount": tranactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": tranactionData.ordersList.toJson(),
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
  }

  ({AmountModel amount, OrdersModel ordersList}) getTransactionsData() {
    var amountModel = AmountModel(
      total: "70",
      currency: "USD",
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: "70"),
    );
    List<Order> orders = [
      Order(
        name: "Apple",
        currency: "USD",
        quantity: 4,
        price: "5",
      ),
      Order(
        name: "Pineapple",
        currency: "USD",
        quantity: 5,
        price: "10",
      ),
    ];
    var ordersList = OrdersModel(orders: orders);
    return (amount: amountModel, ordersList: ordersList);
  }
}
