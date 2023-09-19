import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/constant/asset_list.dart';
import 'package:shopify_dohan/common/utils/extensions/size.dart';

const double _itemSize = 60.0;

class _SplashImageWidget extends StatelessWidget {
  const _SplashImageWidget({
    // ignore: unused_element
    this.size,
    required this.path,
  });

  final double? size;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: size ?? _itemSize,
      height: size ?? _itemSize,
      fit: BoxFit.contain,
    );
  }
}

class RotatingItemWidget extends StatelessWidget {
  const RotatingItemWidget({
    super.key,
    required this.rotationAnimation,
    required this.animationController,
  });

  final Animation<double> rotationAnimation;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * .6,
      // color: Colors.amber,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: context.height * .52,
            right: 0,
            left: 0,
            child: _AnimatedRotatingWidget(
              animationController: animationController,
              rotationAnimation: rotationAnimation,
              assetPath: AssetList.airpodsSplash,
            ),
          ),
          Positioned(
            bottom: context.height * .45,
            right: context.width * .22,
            child: _AnimatedRotatingWidget(
              animationController: animationController,
              rotationAnimation: rotationAnimation,
              assetPath: AssetList.headsetSplash,
            ),
          ),
          Positioned(
            bottom: context.height * .45,
            left: context.width * .22,
            child: _AnimatedRotatingWidget(
              animationController: animationController,
              rotationAnimation: rotationAnimation,
              assetPath: AssetList.watchSplash,
            ),
          ),
          Positioned(
            bottom: context.height * .32,
            left: context.width * .24,
            child: _AnimatedRotatingWidget(
              animationController: animationController,
              rotationAnimation: rotationAnimation,
              assetPath: AssetList.iphoneSplash,
            ),
          ),
          Positioned(
            bottom: context.height * .32,
            right: context.width * .24,
            child: _AnimatedRotatingWidget(
              animationController: animationController,
              rotationAnimation: rotationAnimation,
              assetPath: AssetList.samsungSplash,
            ),
          ),
          Positioned(
            bottom: context.height * .26,
            right: 0,
            left: 0,
            child: _AnimatedRotatingWidget(
              animationController: animationController,
              rotationAnimation: rotationAnimation,
              assetPath: AssetList.chargerSplash,
            ),
          )
        ],
      ),
    );
  }
}

class _AnimatedRotatingWidget extends StatelessWidget {
  const _AnimatedRotatingWidget({
    required this.animationController,
    required this.rotationAnimation,
    required this.assetPath,
  });

  final AnimationController animationController;
  final Animation<double> rotationAnimation;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return RotationTransition(
          turns: rotationAnimation,
          child: child,
        );
      },
      child: _SplashImageWidget(
        path: assetPath,
      ),
    );
  }
}
