import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/presentation/manager/stripe_payment_cubit.dart';
import 'package:paymentapp/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:paymentapp/core/utils/apiKeys.dart';

import '../../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
        builder: (context, state) {
      return CustomButton(
        onTap: (){
        /*  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: "100", currency: "usd");
          BlocProvider.of<StripePaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
        */
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: false,
            clientId: ApiKeys.clientIDPayPal,
            secretKey: ApiKeys.clientIDPayPal,
            transactions: const [
              {
                "amount": {
                  "total": '100',
                  "currency": "USD",
                  "details": {
                    "subtotal": '100',
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                // "payment_options": {
                //   "allowed_payment_method":
                //       "INSTANT_FUNDING_SOURCE"
                // },
                "item_list": {
                  "items": [
                    {
                      "name": "Apple",
                      "quantity": 4,
                      "price": '10',
                      "currency": "USD"
                    },
                    {
                      "name": "Pineapple",
                      "quantity": 5,
                      "price": '12',
                      "currency": "USD"
                    }
                  ],

                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              print("onSuccess: $params");
              Navigator.pop(context);
            },
            onError: (error) {
              print("onError: $error");
              Navigator.pop(context);
            },
            onCancel: () {
              print('cancelled:');
              Navigator.pop(context);
            },
          ),
        ));
        },
        isLoading: state is StripePaymentLoading ? true : false,
        text: "Continue",
      );
    }, listener: (context, state) {
      if (state is StripePaymentSuccess) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const ThankYouView();
        }));
      }
      if (state is StripePaymentFailure) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(content: Text(state.errMsg));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}
