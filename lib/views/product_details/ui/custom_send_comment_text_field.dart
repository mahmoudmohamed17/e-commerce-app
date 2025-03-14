import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/build_border.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSendCommentTextField extends StatelessWidget {
  const CustomSendCommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.regular14,
      decoration: InputDecoration(
        hintText: 'Type your feedback',
        hintStyle: AppTextStyles.regular14.copyWith(
          color: AppColors.kGreyColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.paperPlane,
            color: AppColors.kPrimaryColor,
            size: 20,
          ),
        ),
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
