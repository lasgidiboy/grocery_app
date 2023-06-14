import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/const/theme_data.dart';
import 'package:grocery_app_admin_panel/inner_screens/on_sale_screen.dart';
import 'package:grocery_app_admin_panel/provider/dark_theme_provider.dart';
import 'package:grocery_app_admin_panel/screens/nav_bar.dart';
import 'package:provider/provider.dart';

import 'inner_screens/feeds_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

//  this here which is fetching the theme from the shared preference so if the user already choose a value the last choosing value will be applied
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          debugShowCheckedModeBanner: false,
          home: const BottomNavBar(),
          routes: {
            '/OnSale': (context) => OnSaleScreen(),
            '/FeedsScreen': (context) => FeedsScreen(),
          },
        );
      }),
    );
  }
}
