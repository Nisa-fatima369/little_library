import 'package:flutter/material.dart';
import 'package:little_library/widgets/theme/colors.dart';

String robotoFontFamily = "Roboto";

ThemeData themeData = ThemeData(
  fontFamily: robotoFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppColors.background1,
    secondary: AppColors.secondary,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.secondary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    iconTheme: IconThemeData(color: AppColors.secondary),
    titleTextStyle: TextStyle(
      color: AppColors.secondary,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    elevation: 0,
  ),
  
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.primary,
  ),
  
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.primaryText,
      fontWeight: FontWeight.w900,
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontSize: 30,
    ),
    headlineSmall: TextStyle(
      color: AppColors.secondary,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
    titleLarge: TextStyle(
      color: AppColors.primaryText,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
    labelLarge: TextStyle(
      color: AppColors.primaryText,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
      color: AppColors.placeholderText,
      fontWeight: FontWeight.w300,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      color: AppColors.primaryText,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
    bodySmall: TextStyle(
      color: AppColors.primaryText,
      fontSize: 14,
    ),
  ),
);
