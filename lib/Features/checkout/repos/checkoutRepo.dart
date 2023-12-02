import 'package:dartz/dartz.dart';
import 'package:paymentapp/Features/checkout/data/models/paymentIntentInputModel.dart';

import '../../../Errors/failures.dart';

abstract class CheckoutRepos {
  Future<Either <Failures , void>>  makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}
