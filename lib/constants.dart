import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';

final kTextField = InputDecoration(
  helperStyle: const TextStyle(
    color: AppColors.primaryText,
  ),
  floatingLabelStyle: const TextStyle(
    color: AppColors.primaryText,
  ),
  labelStyle: const TextStyle(
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
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  focusedErrorBorder: InputBorder.none,
  errorStyle: const TextStyle(color: Colors.red),
  hoverColor: AppColors.background1,
  focusColor: AppColors.background1,
  fillColor: AppColors.background1,
  filled: true,
);

//Search TextField
final kSearchTextField = InputDecoration(
  helperStyle: const TextStyle(
    color: AppColors.primaryText,
  ),
  floatingLabelStyle: const TextStyle(
    color: AppColors.primaryText,
  ),
  labelStyle: const TextStyle(
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
    borderSide: const BorderSide(
      color: AppColors.border,
    ),
  ),
  hoverColor: AppColors.background1,
  focusColor: AppColors.background1,
  fillColor: AppColors.background1,
  filled: true,
);
