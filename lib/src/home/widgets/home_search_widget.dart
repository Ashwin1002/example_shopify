import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/constant/asset_list.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/common/utils/extensions/space_extension.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 10.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: 18,
              child: Image.asset(
                AssetList.logoNoBG,
                height: 30,
                width: 30,
              ),
            ),
            10.0.spaceX,
            Flexible(
              child: CupertinoSearchTextField(
                enabled: false,
                prefixIcon: Image.asset(
                  AssetList.searchIcon,
                  height: 24,
                  width: 24,
                  color: context.theme.greyColor,
                ),
                placeholder: "",
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            10.0.spaceX,
            Image.asset(
              AssetList.cartIcon,
              height: 24,
              width: 24,
              color: Colors.white,
            ),
            5.0.spaceX,
          ],
        ),
      ),
    );
  }
}
