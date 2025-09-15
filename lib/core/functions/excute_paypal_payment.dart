import 'package:check_out_app/features/check_out/data/models/amount_model/amount_model.dart';
import 'package:check_out_app/features/check_out/data/models/orders_model/orders_model.dart';
import 'package:check_out_app/features/check_out/presentation/views/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../utils/api_keys.dart';

void excutePayPalPayment(BuildContext context,
      ({AmountModel amount, OrdersModel ordersList}) tranactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalSecretId,
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
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => ThankYouView()),
              (route) {
            if (route.settings.name == '/') {
              return true;
            } else {
              return false;
            }
          });
        },
        onError: (error) {
          print("onError: $error");
          SnackBar snackBar = SnackBar(content: Text(error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }