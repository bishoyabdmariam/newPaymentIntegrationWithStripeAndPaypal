import 'package:flutter/material.dart';
import 'package:paymentapp/Features/Checkout/Presentation/Views/MyCartViewBody.dart';
import 'package:paymentapp/core/utils/styles.dart';

import 'Widgets/appBar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar('My Cart'),
      body: const MyCardViewBody(),
    );
  }

}
