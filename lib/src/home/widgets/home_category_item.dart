import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/common/utils/extensions/size.dart';
import 'package:shopify_dohan/common/utils/extensions/space_extension.dart';
import 'package:shopify_dohan/common/widgets/decoration/custom_decoration.dart';

class HomeCategoryItemWidget extends StatelessWidget {
  const HomeCategoryItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: context.width * .16,
              width: context.width * .16,
              decoration: CustomDecoration.containerDecoration(
                hasShadow: true,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                index % 2 == 0
                    ? Icons.apple
                    : CupertinoIcons.device_phone_portrait,
                size: 50.0,
                color: index % 2 != 0
                    ? context.theme.primaryColor
                    : Colors.grey.shade500,
              ),
            ),
            10.0.spaceY,
            Text(
              index % 2 != 0 ? 'Samsung' : 'Apple',
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
