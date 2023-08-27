import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';

final kTextField = InputDecoration(
  helperStyle: TextStyle(
    color: AppColors.primaryText,
  ),
  floatingLabelStyle: TextStyle(
    color: AppColors.primaryText,
  ),
  labelStyle: TextStyle(
    color: AppColors.primaryText,
  ),
  iconColor: AppColors.secondary,
  prefixIconColor: AppColors.secondary,
  hintStyle: const TextStyle(
    color: AppColors.placeholderText,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(
      color: AppColors.border,
    ),
  ),
  hoverColor: AppColors.background1,
  focusColor: AppColors.background1,
  fillColor: AppColors.background1,
  filled: true,
);

//Search TextField
final kSearchTextField = InputDecoration(
  helperStyle: TextStyle(
    color: AppColors.primaryText,
  ),
  floatingLabelStyle: TextStyle(
    color: AppColors.primaryText,
  ),
  labelStyle: TextStyle(
    color: AppColors.primaryText,
  ),
  iconColor: AppColors.secondary,
  prefixIconColor: AppColors.secondary,
  hintStyle: const TextStyle(
    color: AppColors.placeholderText,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: AppColors.border,
    ),
  ),
  hoverColor: AppColors.background1,
  focusColor: AppColors.background1,
  fillColor: AppColors.background1,
  filled: true,
);
