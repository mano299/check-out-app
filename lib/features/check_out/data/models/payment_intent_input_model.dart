class PaymentIntentInputModel {
  final String amount, currency;

  const PaymentIntentInputModel({required this.amount, required this.currency});

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
