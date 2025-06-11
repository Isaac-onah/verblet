
import 'package:flutter/material.dart';
import 'package:verblet/core/sizes.dart';
import 'package:verblet/core/theme/app_pallete.dart';

///-- Light & Dark Elevated Button Themes
class MyElevatedButtonTheme {

  MyElevatedButtonTheme._(); //To avoid creating instances

  ///-- Light Theme

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.light,
      backgroundColor: MyColors.primary,
      disabledForegroundColor: MyColors.darkGrey,
      disabledBackgroundColor: MyColors.buttonDisabled,
      padding: const EdgeInsets.symmetric(vertical:AppSizes.buttonHeight),
      textStyle: const TextStyle (
          fontSize: 16, color: MyColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),),

  );

// ElevatedButtonThemeData

  /// Dark Theme

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: MyColors.light,
      backgroundColor: MyColors.primary,
      disabledForegroundColor: MyColors.darkGrey,
      disabledBackgroundColor: MyColors.darkerGrey,
      padding: const EdgeInsets.symmetric(vertical:AppSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: MyColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  ); // ElevatedButtonThemeData
}