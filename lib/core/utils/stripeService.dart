import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentModel/PaymentIntent.dart';
import 'package:paymentapp/core/utils/apiKeys.dart';
import 'package:paymentapp/core/utils/apiService.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntent> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: PaymentIntentInputModel(amount: '1000', currency: "usd").toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    PaymentIntent paymentIntent = PaymentIntent.fromJson(response.data);
    return paymentIntent;
  }
}
