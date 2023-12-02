import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentModel/PaymentIntentModel.dart';
import 'package:paymentapp/core/utils/apiKeys.dart';
import 'package:paymentapp/core/utils/apiService.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: PaymentIntentInputModel(amount: '1000', currency: "usd").toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    PaymentIntentModel paymentIntent =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntent;
  }

  Future initPaymentSheet({required String clientSecret}) async {
   await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Bishoy",
      ),
    );
  }

  Future displayPaymentSheet() async {
   await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(clientSecret: paymentIntentModel.clientSecret);
    await displayPaymentSheet();
  }
}
