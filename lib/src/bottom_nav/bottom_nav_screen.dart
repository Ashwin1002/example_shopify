import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopify_dohan/common/constant/constant_list.dart';
import 'package:shopify_dohan/common/utils/extensions/custom_theme_extension.dart';
import 'package:shopify_dohan/src/home/view/home_screen.dart';
import 'package:shopify_dohan/src/products/view/product_category_list.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ProductCategoryListScreen(),
    const Placeholder(),
    const Placeholder(),
  ];

  int _selectedIndex = 0;

  onBack() async {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedIconColor = context.theme.primaryColor!;
    final Color iconColor = context.theme.navIconColor!;

    return WillPopScope(
      onWillPop: () {
        return onBack();
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: Platform.isAndroid ? 65 : 90,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.shade400, width: 0.2),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomNavigationBar(
                  items:
                      List.generate(ConstantList.bottomNavList.length, (index) {
                    return BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 3.5),
                        child: SingeBottomNavIconWidget(
                          iconPath: ConstantList.bottomNavList[index].first,
                          iconColor: _selectedIndex == index
                              ? selectedIconColor
                              : iconColor,
                        ),
                      ),
                      label: ConstantList.bottomNavList[index].last,
                    );
                  }),
                  currentIndex: _selectedIndex,
                  backgroundColor: context.theme.langBgColor,
                  unselectedItemColor: iconColor,
                  selectedItemColor: selectedIconColor,
                  elevation: 0,

                  selectedLabelStyle: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: context.theme.primaryColor,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                  ),
                  showUnselectedLabels: true,
                  // iconSize: 18.5,
                  type: BottomNavigationBarType.fixed,
                  onTap: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingeBottomNavIconWidget extends StatelessWidget {
  const SingeBottomNavIconWidget({
    super.key,
    required this.iconPath,
    this.iconColor,
  });

  final String iconPath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      height: 24,
      width: 24,
      color: iconColor,
    );
  }
}
