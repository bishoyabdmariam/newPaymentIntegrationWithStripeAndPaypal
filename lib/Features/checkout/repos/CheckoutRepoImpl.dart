import 'package:dartz/dartz.dart';

import 'package:paymentapp/Errors/failures.dart';

import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';
import 'package:paymentapp/core/utils/stripeService.dart';

import 'checkoutRepo.dart';

class CheckoutRepoImpl extends CheckoutRepos {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
       return left(ServerFailures(errorMsg: e.toString()));
    }
  }
}
