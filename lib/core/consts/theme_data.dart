

import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles{
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context
}){
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
      ? AppColors.darkScaffoldColor
      : AppColors.lightScaffoldColor,
      cardColor: isDarkTheme
          ? const Color.fromARGB(255, 13, 6, 37)
          : AppColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(

        backgroundColor: isDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        centerTitle: false,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: isDarkTheme?Colors.white:Colors.black)
      )
    );

  }
}