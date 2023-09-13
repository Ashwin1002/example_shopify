import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/config/global_variable.dart';

final _context = GlobalVariable.navigatorState.currentState!.context;

class CustomDecoration {
  const CustomDecoration._();

  static containerDecoration({
    Color? backgroundColor,
    BorderRadius? borderRadius,
    BoxBorder? border,
    BoxShape? boxShape,
    Gradient? gradient,
    DecorationImage? image,
    bool hasShadow = false,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? _context.theme.backgroundColor,
      borderRadius: boxShape == BoxShape.circle
          ? null
          : borderRadius ?? BorderRadius.circular(12.0),
      border: border,
      shape: boxShape ?? BoxShape.rectangle,
      gradient: gradient,
      image: image,
      boxShadow: hasShadow
          ? const [
              BoxShadow(
                color: Color(0xFFA3B1C6),
                blurRadius: 10,
                offset: Offset(5, 5),
                spreadRadius: 2,
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
                offset: Offset(-5, -5),
                spreadRadius: 2,
              ),
            ]
          : null,
    );
  }
}
