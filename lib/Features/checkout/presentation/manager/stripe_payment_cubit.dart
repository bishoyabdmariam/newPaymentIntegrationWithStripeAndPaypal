import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/Features/checkout/repos/checkoutRepo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkoutRepos) : super(StripePaymentInitial());
  final CheckoutRepos checkoutRepos;

  Future makePayment ({required PaymentIntentInputModel paymentIntentInputModel})async{
    emit(StripePaymentLoading());
    var data  = await checkoutRepos.makePayment(paymentIntentInputModel: paymentIntentInputModel);
    data.fold((l) => emit(StripePaymentFailure(l.errorMsg)), (r) => emit(StripePaymentSuccess()));
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    print(change.toString());
    super.onChange(change);
  }

}
