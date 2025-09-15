import 'package:check_out_app/core/utils/api_keys.dart';
import 'package:check_out_app/core/utils/api_service.dart';
import 'package:check_out_app/features/check_out/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:check_out_app/features/check_out/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String ephemeralKeySecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerEphemeralKeySecret: ephemeralKeySecret,
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerId: ApiKeys.customerID,
        merchantDisplayName: 'Mano',
      ),
    );
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeySecret =
        await createEphemeralKey(customerID: ApiKeys.customerID);
    await initPaymentSheet(
        ephemeralKeySecret: ephemeralKeySecret.secret!,
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerID}) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {
        'customer': customerID,
      },
      token: ApiKeys.secretKey,
      headers: {"Authorization": "Bearer ${ApiKeys.secretKey}"},
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
