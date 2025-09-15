class PaymentIntentInputModel {
  final String amount, currency;
  final String? customerID;

  const PaymentIntentInputModel({
    this.customerID,
    required this.amount,
    required this.currency,
  });

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerID,
    };
  }
}
