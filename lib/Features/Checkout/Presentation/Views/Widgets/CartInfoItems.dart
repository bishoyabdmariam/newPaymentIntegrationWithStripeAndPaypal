import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/styles.dart';

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
