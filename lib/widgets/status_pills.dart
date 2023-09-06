import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';

Widget availableStatusPills() {
  return Container(
    height: 30,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: AppColors.lightGreen,
    ),
    child: const Padding(
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          'Available',
          style: TextStyle(
            color: AppColors.success,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

Widget unavailableStatusPills() {
  return Container(
    height: 30,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: AppColors.lightPink,
    ),
    child: const Padding(
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          'Unavailable',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.failure,
          ),
        ),
      ),
    ),
  );
}
