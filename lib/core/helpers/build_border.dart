import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.kBordersideColor),
  );
}
