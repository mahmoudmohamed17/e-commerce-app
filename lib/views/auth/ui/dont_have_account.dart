import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/auth/ui/signup_view.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account? ', style: AppTextStyles.bold12),
        GestureDetector(
          onTap: () {
            context.pushNamed(SignupView.id);
          },
          child: Text(
            'Create Account',
            style: AppTextStyles.bold12.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
