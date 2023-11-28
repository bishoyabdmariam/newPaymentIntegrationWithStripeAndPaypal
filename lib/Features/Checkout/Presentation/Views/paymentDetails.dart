import 'package:flutter/material.dart';

import 'Widgets/appBar.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Payment Details"),
    );
  }
}
