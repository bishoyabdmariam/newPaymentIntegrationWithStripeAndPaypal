import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentapp/core/utils/styles.dart';

import 'Widgets/CartInfoItems.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/TotalPrice.dart';

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
          Expanded(
            child: Image.asset(
              "assets/images/Group6.png",
            ),
          ),
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
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xFFC6C6C6),
          ),
          const TotalPrice(title: "Total", value: "\$54.00"),
          CustomButton(onTap: () {}),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
