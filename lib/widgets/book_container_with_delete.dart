import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';

Widget deleted_Book_Container(Size size) {
  return Stack(
    children: [
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          height: 130,
          width: 120,
          color: AppColors.grey,
        ),
      ),
      const Positioned(
        right: 10,
        top: 10,
        child: Icon(
          Icons.delete,
          color: AppColors.failure,
          size: 30,
        ),
      ),
    ],
  );
}
