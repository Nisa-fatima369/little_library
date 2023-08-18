import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static const blue = Color(0XFF2D9CDB);
  static const lightPink = Color(0XFFFFEBE6);
  static const lightGreen = Color(0XFFE3FCEF);
  static const success = Color(0XFF00AC41);
  static const failure = Color(0XFFC53532);
  static const warning = Color(0XFFFF8C00);
  static const primary = Color(0XFFFEC260);
  static const primaryGradient = Color(0XFFDFAA54);
  static const primaryVariant = Color(0XFFFFE8C3);
  static const secondary = Color(0XFF2A0944);
  static const secondaryGradient = Color(0XFF4E3465);
  static const secondaryVariant = Color(0XFF625CA0);
  static const extraColor = Color(0XFFA10035);
  static const background1 = Color(0XFFF9FDFF);
  static const background2 = Color(0XFFFFFFFF);
  static const border = Color(0XFFDFE1E6);
  static const primaryText = Color(0XFF0F0F0F);
  static const disabled = Color(0XFFCCCCCC);
  static const secondaryText = Color(0XFF2A0944);
  static const hoverColor = Color.fromARGB(255, 233, 230, 230);
  static const placeholderText = Color(0XFF808080);
  static const grey = Color(0XFFF2F2F2);
}
