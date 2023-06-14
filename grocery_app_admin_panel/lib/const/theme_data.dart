import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xFF00001a) : const Color(0xfffffffff),
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary:
                isDarkTheme ? const Color(0xff1a1f3d) : const Color(0xffe8fdfd),
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
      cardColor:
          isDarkTheme ? const Color(0xFF0a0d2c) : const Color(0xfff2fdfd),
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],

      // if you are going to need the button theme then the context at the method above must be include else you dont need the context.
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light(),
          ),
      // navigationBarTheme: NavigationBarThemeData(
      //     indicatorColor: isDarkTheme ? Colors.red : Colors.white,
      //     iconTheme: MaterialStatePropertyAll(
      //       IconThemeData(color: isDarkTheme ? Colors.lightBlue : Colors.black),
      //     )),
    );
  }
}
