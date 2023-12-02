import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentModel/PaymentIntentModel.dart';
import 'package:paymentapp/core/utils/apiKeys.dart';
import 'package:paymentapp/core/utils/apiService.dart';

import '../../Features/checkout/data/models/CustomerModel.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: PaymentIntentInputModel(
        amount: '1000',
        currency: "usd",
      ).toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    PaymentIntentModel paymentIntent =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntent;
  }

  Future<EphemeralKey> createEphemeralKey(String customerId) async {
    var response = await apiService.post(
      body: {
        "customer": customerId,
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2023-10-16",
      },
    );

    EphemeralKey ephemeralKey = EphemeralKey.fromJson(response.data);
    return ephemeralKey;
  }

  Future initPaymentSheet({
    required String clientSecret,
    required String ephemeralKey,
    required String customerId,
    required String name,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerEphemeralKeySecret: ephemeralKey,
        paymentIntentClientSecret: clientSecret,
        customerId: customerId,
        merchantDisplayName: name,
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
    EphemeralKey ephemeralKey = await createEphemeralKey("cus_P74kb9jB1DyJEC");
    await initPaymentSheet(
      clientSecret: paymentIntentModel.clientSecret,
      customerId: "cus_P74kb9jB1DyJEC",
      ephemeralKey: ephemeralKey.secret!,
      name: ephemeralKey.id!,
    );
    await displayPaymentSheet();
  }
}
