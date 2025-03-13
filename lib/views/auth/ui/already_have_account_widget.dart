
import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? ', style: AppTextStyles.bold12),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: AppTextStyles.bold12.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
