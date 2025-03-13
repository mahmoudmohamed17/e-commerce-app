import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_social_button.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Text(
            'Welcome to Shoply',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 16,
                children: [
                  const CustomTextFormField(labelText: 'Email'),
                  const CustomTextFormField(labelText: 'Password'),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyles.bold12.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                  CustomSocialButton(label: 'Login', onTap: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

