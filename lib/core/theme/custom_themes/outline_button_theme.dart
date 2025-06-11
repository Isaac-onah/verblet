import 'package:flutter/material.dart';
import 'package:verblet/core/theme/app_pallete.dart';
/*

Light & Dark Outlined Button Themes -- */

class MyOutlinedButtonTheme {

  MyOutlinedButtonTheme._(); //To avoid creating instances


  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(

      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          side: BorderSide (color: MyColors.primary),
          textStyle: const TextStyle (fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  )
  );


/* Dark Theme --*/

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
  foregroundColor: Colors.white,
  side: BorderSide (color: MyColors.primary),
  textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),

  ),

  );

}