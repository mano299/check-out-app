import 'package:check_out_app/core/errors/failures.dart';
import 'package:check_out_app/core/utils/stripe_service.dart';

import 'package:check_out_app/features/check_out/data/models/payment_intent_input_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on StripeException catch (e) {
      return left(ServiceFailure(
          errMessage:
              e.error.message ?? 'Oops there is an error, try again later'));
    } catch (e) {
      return left(ServiceFailure(errMessage: e.toString()));
    }
  }
}
