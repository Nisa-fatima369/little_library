import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/widgets/theme/colors.dart';

class Reusable extends StatelessWidget {
  final String hintText;
  final Icon icon;
  const Reusable({
    super.key,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.border,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        decoration: kTextField.copyWith(
          hintText: hintText,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
