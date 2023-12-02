class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId = "cus_P74kb9jB1DyJEC",
  });

  toJson() {
    return {
      "amount": (int.parse(amount) *100).toString(),
      "currency": currency,
      "customer" :customerId,
    };
  }
}
