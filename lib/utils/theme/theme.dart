import 'package:ecommerce_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:ecommerce_store/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetThemeData,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxThemeData,
    chipTheme: CustomChipTheme.lightChipThemeData,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonThemeData,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetThemeData,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxThemeData,
    chipTheme: CustomChipTheme.darkChipThemeData,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonThemeData,
  );
}
