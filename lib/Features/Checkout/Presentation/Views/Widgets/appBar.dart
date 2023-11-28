
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    leading: const Icon(Icons.arrow_back_ios_new_outlined),
    title:   Text(
      title,
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
