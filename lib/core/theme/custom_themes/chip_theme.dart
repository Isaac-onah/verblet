import 'package:flutter/material.dart';
import 'package:verblet/core/theme/app_pallete.dart';

class MyChipTheme {

  MyChipTheme._();

static ChipThemeData lightChipTheme = ChipThemeData(

  disabledColor: Colors.grey.withOpacity(0.4),

  labelStyle: const TextStyle(color: Colors.black),

  selectedColor: MyColors.primary,

  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),

  checkmarkColor: Colors.white,
  color: MaterialStatePropertyAll(MyColors.primaryBackground),
  side: BorderSide.none
); // Chip ThemeData

static ChipThemeData darkChipTheme = const ChipThemeData(

  disabledColor: Colors.grey,

  labelStyle: TextStyle (color: Colors.white),

  selectedColor: MyColors.primary,

  padding: EdgeInsets.symmetric (horizontal: 12.0, vertical: 12),

  checkmarkColor: Colors.white,
    color: MaterialStatePropertyAll(MyColors.primaryBackground)
)

; // ChipThemeData

}