import 'package:flutter/cupertino.dart';
import 'package:paymentapp/core/utils/styles.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Image.asset("assets/images/Group6.png"),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: "Order Subtotal",
            value: "\$42.97",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: "Discount",
            value: "\$0",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: "Shipping",
            value: "\$9.0",
          ),
        ],
      ),
    );
  }
}

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Text(
          value,
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
