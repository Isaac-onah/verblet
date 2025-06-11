
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:verblet/core/sizes.dart';
import 'package:verblet/core/theme/app_pallete.dart';

class MyAppBarTheme{

  MyAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme (
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyColors.black, size:AppSizes.iconMd),
    actionsIconTheme: IconThemeData(color: MyColors.black, size:AppSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.black),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // dark icons for light backgrounds
      statusBarBrightness: Brightness.light,    // iOS
    ),
  );

//
  static const darkAppBarTheme = AppBarTheme (
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyColors.black, size:AppSizes.iconMd),
    actionsIconTheme: IconThemeData(color: MyColors.white, size:AppSizes.iconMd),
    titleTextStyle: TextStyle (fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.white),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // light icons for dark backgrounds
      statusBarBrightness: Brightness.dark,      // iOS
    ),
  );
}