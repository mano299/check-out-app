import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_service.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String setupIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        setupIntentClientSecret: setupIntentClientSecret,
        customerId: 'Mano',
      ),
    );
  }

  Future presentPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }
}
