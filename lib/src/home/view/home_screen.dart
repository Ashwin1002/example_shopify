import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/common/utils/extensions/size.dart';
import 'package:shopify_dohan/common/utils/extensions/space_extension.dart';
import 'package:shopify_dohan/common/widgets/custom_network_widget.dart';
import 'package:shopify_dohan/src/home/widgets/home_category_item.dart';
import 'package:shopify_dohan/src/home/widgets/home_product_item.dart';
import 'package:shopify_dohan/src/home/widgets/home_search_widget.dart';

const _imageList = [
  'https://fastly.picsum.photos/id/26/4209/2769.jpg?hmac=vcInmowFvPCyKGtV7Vfh7zWcA_Z0kStrPDW3ppP0iGI',
  'https://fastly.picsum.photos/id/96/4752/3168.jpg?hmac=KNXudB1q84CHl2opIFEY4ph12da5JD5GzKzH5SeuRVM',
  'https://fastly.picsum.photos/id/60/1920/1200.jpg?hmac=fAMNjl4E_sG_WNUjdU39Kald5QAHQMh-_-TsIbbeDNI',
  'https://fastly.picsum.photos/id/39/3456/2304.jpg?hmac=cc_VPxzydwTUbGEtpsDeo2NxCkeYQrhTLqw4TFo-dIg',
  'https://fastly.picsum.photos/id/7/4728/3168.jpg?hmac=c5B5tfYFM9blHHMhuu4UKmhnbZoJqrzNOP9xjkV4w3o',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    scrollPhysics: const BouncingScrollPhysics(),
                    reverse: false,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(
                      milliseconds: 8000,
                    ),
                    height: context.height * .32,
                  ),
                  itemCount: _imageList.length,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    return CustomNetWorkWidget(
                      url: _imageList[itemIndex],
                      width: context.width,
                      borderRadius: BorderRadius.zero,
                    );
                  },
                ),
                const HomeSearchWidget(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: 20.0.spaceY,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _HomeHeadingWidget(
                  label: 'Categories',
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 25.0,
                    horizontal: 12.0,
                  ),
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => HomeCategoryItemWidget(
                        index: index,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const _HomeHeadingWidget(
                      label: 'What\'s New',
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        children: [
                          Text(
                            'See All',
                            style: TextStyle(color: context.theme.greyColor!),
                          ),
                          5.0.spaceX,
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14.0,
                            color: context.theme.greyColor!,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                20.0.spaceY,
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .74,
                mainAxisSpacing: 40,
                crossAxisSpacing: 25,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return HomeProductListItemWidget(
                  url: _imageList.first,
                  label: 'New Iphone 14 pro Max Cover 256 GB 2023 Edition',
                  price: '22.0',
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.0.spaceY,
                const _HomeHeadingWidget(
                  label: 'Recommendation',
                ),
                20.0.spaceY,
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 25.0),
              child: Row(
                children: List.generate(
                  _imageList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: HomeProductListItemWidget(
                      url: _imageList[index],
                      label: 'Airpod Pro Leather Case',
                      price: (index * 3.3).toStringAsFixed(2),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 20.0.spaceY,
          ),
        ],
      ),
    );
  }
}

class _HomeHeadingWidget extends StatelessWidget {
  const _HomeHeadingWidget(
      {required this.label,
      // ignore: unused_element
      this.textStyle});

  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        label,
        style: textStyle ??
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            ),
      ),
    );
  }
}
