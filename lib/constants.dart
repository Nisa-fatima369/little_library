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

const y5 = SizedBox(height: 5);
const y10 = SizedBox(height: 10);
const y15 = SizedBox(height: 15);
const y20 = SizedBox(height: 20);
const y30 = SizedBox(height: 30);
const y40 = SizedBox(height: 40);
const y80 = SizedBox(height: 80);
const y100 = SizedBox(height: 100);


const x5 = SizedBox(width: 5);
const x10 = SizedBox(width: 10);
const x15 = SizedBox(width: 15);
const x20 = SizedBox(width: 20);
