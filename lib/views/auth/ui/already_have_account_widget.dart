import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
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
          onTap: () {
            context.pushNamed(LoginView.id);
          },
          child: Text(
            'Login',
            style: AppTextStyles.bold12.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
