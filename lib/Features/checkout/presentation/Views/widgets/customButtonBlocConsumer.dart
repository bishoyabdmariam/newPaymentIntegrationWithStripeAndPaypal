import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/presentation/manager/stripe_payment_cubit.dart';
import 'package:paymentapp/Features/checkout/presentation/views/thank_you_view.dart';

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
          PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: "100", currency: "usd");
          BlocProvider.of<StripePaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
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
