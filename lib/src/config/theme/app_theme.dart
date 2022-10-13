import 'package:flutter/material.dart';

import '../../core/utils/color/colors_manager.dart';
import '../../core/utils/values_manager.dart';

ThemeData get appTheme => ThemeData(
      primaryColor: ColorsManager.primaryColor,
      scaffoldBackgroundColor: ColorsManager.whiteColor,

      //card theme
      cardTheme: CardTheme(
        color: ColorsManager.whiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeValues.s8)),
        elevation: SizeValues.s4,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shadowColor: ColorsManager.blackColor,
      ),

      //bottom navigation bar theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: SizeValues.s0,
    unselectedItemColor: ColorsManager.lightWhiteColor,
    selectedItemColor: ColorsManager.lightBlueColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorsManager.whiteColor,
  ),

      //text theme
      textTheme: TextTheme(
        //TODO: make a style file and remove hard coded
        //title
        titleMedium: TextStyle(
          color: ColorsManager.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: ColorsManager.lightGreyColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        //body
        bodyLarge: TextStyle(
          color: ColorsManager.whiteColor,
          fontSize: 80,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: ColorsManager.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          color: ColorsManager.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        //label
        labelMedium: TextStyle(
          color: ColorsManager.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          color: ColorsManager.greyColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
