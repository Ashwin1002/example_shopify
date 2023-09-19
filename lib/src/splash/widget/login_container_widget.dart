import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/constant/asset_list.dart';
import 'package:shopify_dohan/common/theme/colors.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/common/utils/extensions/space_extension.dart';
import 'package:shopify_dohan/common/widgets/decoration/custom_decoration.dart';

Future<bool> _onWillPop() async {
  return false;
}

class LoginContainerWidget extends StatelessWidget {
  const LoginContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 6,
            decoration: CustomDecoration.containerDecoration(
              backgroundColor: Colors.white,
            ),
          ),
          15.0.spaceY,
          Container(
            decoration: BoxDecoration(
              color: context.theme.backgroundColor == AppColors.backgroundLight
                  ? Colors.white
                  : Colors.white.withOpacity(.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  50.0.spaceY,
                  const Text(
                    "Welcome to Dohans Qatar, \n Sign in to continue",
                    textScaleFactor: 1.1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: .2,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  35.0.spaceY,
                  const _SignInIconButtonWidget(
                    label: "Continue with Google",
                    iconAssetPath: AssetList.googleIcon,
                    showIcon: false,
                  ),
                  15.0.spaceY,
                  const _SignInIconButtonWidget(
                    label: "Continue with Apple",
                    iconData: Icons.apple,
                    color: Colors.black,
                  ),
                  15.0.spaceY,
                  _SignInIconButtonWidget(
                    label: "Sign In With Email & Password",
                    color: context.theme.primaryColor,
                    showIcon: false,
                  ),
                  15.0.spaceY,
                  Row(
                    children: [
                      40.0.spaceX,
                      Flexible(
                        child: Divider(
                          color: context.theme.primaryColor,
                          thickness: .8,
                        ),
                      ),
                      10.0.spaceX,
                      const Text(
                        'OR',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      10.0.spaceX,
                      Flexible(
                        child: Divider(
                          color: context.theme.primaryColor,
                          thickness: .8,
                        ),
                      ),
                      40.0.spaceX,
                    ],
                  ),
                  15.0.spaceY,
                  _SignInIconButtonWidget(
                    label: "Continue as Guest",
                    color: context.theme.secondaryColor,
                    iconData: Icons.person_4,
                  ),
                  30.0.spaceY,
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 14.0,
                        letterSpacing: .4,
                        color: context.theme.backgroundColor ==
                                AppColors.backgroundLight
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  25.0.spaceY,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignInIconButtonWidget extends StatelessWidget {
  const _SignInIconButtonWidget(
      {this.iconData,
      required this.label,
      this.color,
      this.showIcon = true,
      this.iconAssetPath});

  final IconData? iconData;
  final String label;
  final Color? color;
  final bool showIcon;
  final String? iconAssetPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.grey.shade100,
        ),
        child: Row(
          children: [
            if (showIcon == true)
              Icon(
                iconData ?? Icons.facebook,
                color: color != null ? Colors.white : Colors.black,
                size: 26.0,
              ),
            if (iconAssetPath != null)
              Image.asset(
                iconAssetPath ?? '',
                height: 24,
                width: 24,
              ),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: color != null ? Colors.white : Colors.black,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
