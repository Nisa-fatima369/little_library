import 'package:flutter/material.dart';
import 'package:little_library/widgets/theme/colors.dart';

Widget availableStatusPills() {
  return Container(
    height: 30,
    width: 100,
    decoration: BoxDecoration(
      color: AppColors.lightGreen,
    ),
    child: Center(
      child: Text(
        'Available',
        style: TextStyle(
          color: AppColors.success,
        ),
      ),
    ),
  );
}

Widget unavailableStatusPills() {
  return Container(
    height: 30,
    width: 110,
    decoration: BoxDecoration(
      color: AppColors.lightPink,
    ),
    child: Center(
      child: Text(
        'Unavailable',
        style: TextStyle(
          color: AppColors.failure,
        ),
      ),
    ),
  );
}
