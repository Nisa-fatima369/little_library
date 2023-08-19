import 'package:flutter/material.dart';
import 'package:little_library/widgets/theme/colors.dart';

Stack deleted_Book_Container(Size size) {
  return Stack(
    children: [
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          height: size.height * 0.13,
          width: size.width * 0.27,
          color: AppColors.grey,
        ),
      ),
      Positioned(
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
