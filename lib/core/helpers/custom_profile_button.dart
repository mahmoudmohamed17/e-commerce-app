import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/profile/logic/profile_button_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({super.key, required this.model});
  final ProfileButtonModel model;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.onPressed(context);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(model.icon, color: Colors.white),
          Text(
            model.label,
            style: AppTextStyles.bold12.copyWith(color: Colors.white),
          ),
          const Icon(FontAwesomeIcons.chevronRight, color: Colors.white),
        ],
      ),
    );
  }
}
