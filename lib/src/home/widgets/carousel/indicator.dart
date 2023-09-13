import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.isActive})
      : super(
          key: key,
        );

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: isActive ? 25.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: isActive ? context.theme.primaryColor : context.theme.greyColor,
      ),
    );
  }
}
