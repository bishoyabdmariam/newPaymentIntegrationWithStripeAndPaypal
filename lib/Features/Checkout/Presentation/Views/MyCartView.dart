import 'package:flutter/material.dart';
import 'package:paymentapp/Features/Checkout/Presentation/Views/MyCartViewBody.dart';
import 'package:paymentapp/core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios_new_outlined),
        title:  const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
      body: MyCardViewBody(),
    );
  }
}
