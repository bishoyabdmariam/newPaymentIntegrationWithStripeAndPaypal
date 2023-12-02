import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:paymentapp/Features/checkout/data/models/AmountModel.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/presentation/manager/stripe_payment_cubit.dart';
import 'package:paymentapp/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:paymentapp/core/utils/apiKeys.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/ItemListModel.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
        builder: (context, state) {
      return CustomButton(
        onTap: () {
          /*  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: "100", currency: "usd");
          BlocProvider.of<StripePaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
        */
          Order amount = Order(
            total: "100",
            currency: "USD",
            details: OrderDetails(
              shipping: "0",
              shippingDiscount: 0,
              subtotal: "100",
            ),
          );
          ItemList listItem = ItemList(
            items: [
              Item(
                currency: "USD",
                name: "Apple",
                price: "20",
                quantity: 1,
              ),
              Item(
                currency: "USD",
                name: "Banana",
                price: "80",
                quantity: 1,
              ),
            ],
          );/*
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.clientIDPayPal,
              secretKey: ApiKeys.secretKeyPayPal,
              transactions: [
                {
                  "amount": amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": listItem.toJson(),
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
          ));*/
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.clientIDPayPal,
              secretKey: ApiKeys.secretKeyPayPal,
              transactions:  [
                {
                  "amount": amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": listItem.toJson(),
                }
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pop(context);
              },
              onError: (error) {
                log("onError: $error");
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
