import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';

class Reusable extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final bool? obscureText;
  final bool? enable;
  final TextEditingController controller;
  final String? Function(String?)? validattor;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  const Reusable({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText,
    this.enable,
    required this.controller,
    this.validattor,
    this.keyboardType,
    this.inputFormatter,
    required List inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.border,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        inputFormatters: [],
        keyboardType: keyboardType,
        validator: validattor,
        controller: controller,
        decoration: kTextField.copyWith(
          hintText: hintText,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
