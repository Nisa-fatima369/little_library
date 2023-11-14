import 'dart:io';

import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';



class DeletedBookContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback onDelete;

  const DeletedBookContainer({
    Key? key,
    required this.imagePath,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(File(imagePath)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: const Icon(
                Icons.delete,
                color: AppColors.failure,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
