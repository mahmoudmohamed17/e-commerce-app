import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/build_border.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextSearchField extends StatelessWidget {
  const CustomTextSearchField({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.regular14,
      decoration: InputDecoration(
        hintText: 'Search in Market...',
        hintStyle: AppTextStyles.regular14.copyWith(
          color: AppColors.kGreyColor,
        ),
        suffixIcon: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),
          label: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}
