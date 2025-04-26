import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/build_border.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/home/ui/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextSearchField extends StatefulWidget {
  const CustomTextSearchField({super.key});

  @override
  State<CustomTextSearchField> createState() => _CustomTextSearchFieldState();
}

class _CustomTextSearchFieldState extends State<CustomTextSearchField> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {},
      style: AppTextStyles.regular14,
      decoration: InputDecoration(
        hintText: 'Search in Market...',
        hintStyle: AppTextStyles.regular14.copyWith(
          color: AppColors.kGreyColor,
        ),
        suffixIcon: ElevatedButton.icon(
          onPressed: () {
            context.pushNamed(SearchView.id, arguments: searchController.text);
            Future.delayed(const Duration(seconds: 2), () {
              searchController.clear();
            });
          },
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
