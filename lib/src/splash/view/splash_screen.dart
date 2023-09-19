import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopify_dohan/common/constant/asset_list.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/common/utils/extensions/size.dart';
import 'package:shopify_dohan/src/splash/widget/login_container_widget.dart';
import 'package:shopify_dohan/src/splash/widget/rotating_item_widget.dart';

const double _boxSize = 280.0;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _imagePositionAnimation;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;

  late AnimationController _logoAnimationController;
  late Animation<Offset> _logoOffset;
  late Animation<Offset> _textOffset;
  late Animation<double> _logoFadeIn;

  late AnimationController _bottomAnimationController;
  late Animation<Offset> _bottomSlideAnimation;

  bool _hideLogoText = false;

  _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, .2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _imagePositionAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(.5, .7),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ));

    _rotationAnimation = CurvedAnimation(
        parent: _animationController, curve: const Interval(.7, 1));

    _animationController.addListener(_animationListener);

    _animationController.forward();
  }

  void _animationListener() {
    if (_animationController.isCompleted) {
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          _animationController.reverse();

          if (_animationController.value > .95) {
            _logoAnimationController.forward();
          }
        },
      );
    }

    setState(() {});
  }

  _logoAnimationInit() async {
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );

    _logoOffset = Tween<Offset>(
      begin: const Offset(-.2, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _textOffset = Tween<Offset>(
      begin: const Offset(.2, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    _logoFadeIn = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.decelerate,
    ));

    _logoAnimationController.addListener(_logoAnimationListener);
  }

  void _logoAnimationListener() async {
    if (_logoAnimationController.isCompleted) {
      _hideLogoText = true;

      Future.delayed(
        const Duration(milliseconds: 600),
        () {
          _bottomAnimationController.forward();

          showModalBottomSheet(
            context: context,
            enableDrag: false,
            isDismissible: false,
            isScrollControlled: true,
            barrierColor: Colors.black12,
            backgroundColor: Colors.transparent,
            transitionAnimationController: _bottomAnimationController,
            builder: (context) => _buildBottomWidget(),
          );
        },
      );
    }
    setState(() {});
  }

  Widget _buildBottomWidget() => const LoginContainerWidget();

  _bottomAnimationInit() {
    _bottomAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -2),
    ).animate(
      CurvedAnimation(
        parent: _bottomAnimationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _logoAnimationInit();
    _bottomAnimationInit();
  }

  @override
  void dispose() {
    _animationController
      ..removeListener(_animationListener)
      ..dispose();

    _logoAnimationController
      ..removeListener(_logoAnimationListener)
      ..dispose();

    _bottomAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return SlideTransition(
                  position: _offsetAnimation,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: child!,
                  ),
                );
              },
              child: LottieBuilder.asset(
                height: _boxSize,
                width: _boxSize,
                controller: _animationController,
                AssetList.boxAnimationJson,
                repeat: false,
                animate: true,
              ),
            ),
          ),
          Positioned(
            bottom: -10 * _imagePositionAnimation.value,
            child: ScaleTransition(
              scale: _imagePositionAnimation,
              child: RotatingItemWidget(
                rotationAnimation: _rotationAnimation,
                animationController: _animationController,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: context.height * .45,
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _logoAnimationController,
                _bottomAnimationController,
              ]),
              builder: (context, child) {
                return SlideTransition(
                  position: _bottomAnimationController.value > 0
                      ? _bottomSlideAnimation
                      : _logoOffset,
                  child: FadeTransition(
                    opacity: _logoFadeIn,
                    child: child!,
                  ),
                );
              },
              child: Image.asset(
                AssetList.logoNoBG,
                height: 100,
                width: 100,
              ),
            ),
          ),
          Positioned(
            // left: 0,
            right: context.width * .35,
            bottom: context.height * .42,
            child: AnimatedBuilder(
              animation: _logoAnimationController,
              builder: (context, child) {
                return SlideTransition(
                  position: _textOffset,
                  child: FadeTransition(
                    opacity: _logoFadeIn,
                    child: child!,
                  ),
                );
              },
              child: AnimatedOpacity(
                opacity: _hideLogoText ? 0 : 1,
                duration: const Duration(milliseconds: 600),
                child: const Text(
                  'Dohans Qatar',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
