import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_admin_panel/screens/category.dart';
import 'package:grocery_app_admin_panel/screens/home_screen.dart';
import 'package:grocery_app_admin_panel/screens/user.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import 'carts/cart_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndexPage = 2;

  final List<Map<String, dynamic>> _pages = [
    // these will map through the pages  and with different the appbar title
    {'page': const Home(), 'title': 'Home Screen'},
    {'page': CategoryScreen(), 'title': 'Category Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[currentIndexPage]['title']),
      // ),
      bottomNavigationBar: NavigationBar(
        height: 55,
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndexPage = index;
          });
        },
        selectedIndex: currentIndexPage,
        destinations: [
          NavigationDestination(
              icon: Icon(
                currentIndexPage == 0 ? IconlyBold.home : IconlyLight.home,
                color: currentIndexPage == 0 ? Colors.lightBlue : Colors.black,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                currentIndexPage == 1
                    ? IconlyBold.category
                    : IconlyLight.category,
                color: currentIndexPage == 1 ? Colors.lightBlue : Colors.black,
              ),
              label: 'Category'),
          NavigationDestination(
              icon: Icon(
                currentIndexPage == 2 ? IconlyBold.buy : IconlyLight.buy,
                color: currentIndexPage == 2 ? Colors.lightBlue : Colors.black,
              ),
              label: 'Cart'),
          NavigationDestination(
              icon: Icon(
                currentIndexPage == 3 ? IconlyBold.user2 : IconlyLight.user2,
                color: currentIndexPage == 3 ? Colors.lightBlue : Colors.black,
              ),
              label: 'User'),
        ],
      ),
      body: _pages[currentIndexPage]['page'],
    );
  }
}
