import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/constant/asset_list.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/common/utils/extensions/size.dart';
import 'package:shopify_dohan/common/utils/extensions/space_extension.dart';
import 'package:shopify_dohan/common/widgets/custom_network_widget.dart';
import 'package:shopify_dohan/common/widgets/decoration/custom_decoration.dart';

class HomeProductListItemWidget extends StatelessWidget {
  const HomeProductListItemWidget({
    super.key,
    required this.url,
    required this.label,
    required this.price,
    this.onFavPressed,
    this.onCartPressed,
  });

  final String url;
  final String label;
  final String price;
  final VoidCallback? onFavPressed;
  final VoidCallback? onCartPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2.5,
      decoration: CustomDecoration.containerDecoration(
        hasShadow: true,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          CustomNetWorkWidget(
            url: url,
            width: context.width,
            height: context.height * .20,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          10.0.spaceY,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: .5,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: onFavPressed,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: CustomDecoration.containerDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor: Colors.white,
                          border: Border.all(
                            color: context.theme.statusRedColor!,
                          ),
                        ),
                        child: Icon(
                          CupertinoIcons.heart,
                          color: context.theme.statusRedColor!,
                          size: 20.0,
                        ),
                      ),
                    ),
                    8.0.spaceX,
                    InkWell(
                      onTap: onCartPressed,
                      child: Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: CustomDecoration.containerDecoration(
                          backgroundColor: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          height: 20,
                          width: 20,
                          AssetList.cartIcon,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          10.0.spaceY,
        ],
      ),
    );
  }
}
