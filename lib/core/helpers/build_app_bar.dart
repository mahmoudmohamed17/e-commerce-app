import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColors.kPrimaryColor,
    title: Text(title),
    titleTextStyle: AppTextStyles.bold16.copyWith(color: Colors.white),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        context.pop();
      },
      icon: const Icon(FontAwesomeIcons.chevronLeft, color: Colors.white),
    ),
  );
}
