import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/utils/extensions/size.dart';
import 'package:shopify_dohan/common/widgets/decoration/custom_decoration.dart';

class CustomNetWorkWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final String? errorImage;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final BoxBorder? boxBorder;
  const CustomNetWorkWidget({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.errorImage,
    this.shape,
    this.borderRadius,
    this.boxBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width ?? context.width * 0.14,
      height: height ?? context.width * 0.14,
      imageBuilder: (_, imageProvider) => Container(
        decoration: CustomDecoration.containerDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
          borderRadius: borderRadius,
          boxShape: shape,
          border: boxBorder,
        ),
      ),
      placeholder: (context, url) {
        return Container(
          padding: const EdgeInsets.all(6.0),
          decoration: CustomDecoration.containerDecoration(
            backgroundColor: Colors.grey.shade100,
            border: boxBorder,
            borderRadius: borderRadius,
            boxShape: shape,
          ),
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
      errorWidget: (_, url, error) => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: CustomDecoration.containerDecoration(
          backgroundColor: Colors.grey.shade200,
          borderRadius: borderRadius ??
              BorderRadius.all(
                Radius.circular(context.width * 0.02),
              ),
          boxShape: shape,
          border: boxBorder,
        ),
      ),
    );
  }
}
