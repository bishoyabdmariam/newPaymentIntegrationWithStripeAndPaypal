import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'Features/Checkout/Presentation/Views/my_cart_view.dart';

void main() async {
  Stripe.publishableKey = "pk_test_51OHk75EBbIoZFxHc8KeGMortRwJINUt9NVtsj49vWK4HT8RwOYroebeC3Vc0zm9khABaXOjxzv5cH6XQNL3ahWea006Dgb2onr";
  runApp(const CheckoutApp());
}


class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
