// ignore_for_file: prefer_const_constructors

import 'package:safe_tech/common/utils/app_color.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle body = TextStyle(
    fontSize: 16,
  );

  static TextStyle buttonText = TextStyle(
    color: AppColors.myBlack,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}
