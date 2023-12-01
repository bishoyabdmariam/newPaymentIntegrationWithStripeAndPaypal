import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentModel/PaymentIntent.dart';
import 'package:paymentapp/core/utils/apiService.dart';

class StripeService{
  final ApiService apiService = ApiService();

  PaymentIntent createPaymentIntent (PaymentIntentInputModel paymentIntentInputModel){
    apiService.post(body: PaymentIntentInputModel(amount: '1000', currency: "usd").toJson(), url: 'https://api.stripe.com/v1/payment_intents', token: );
  }
}
