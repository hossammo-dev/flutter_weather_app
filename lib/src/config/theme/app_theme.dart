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

  //text theme
  textTheme: TextTheme(
    //TODO: make a style file and remove hard coded
    titleMedium: TextStyle(
      color: ColorsManager.whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
    );
