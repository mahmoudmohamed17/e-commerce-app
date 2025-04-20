import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Text(
            'Enter your Email to reset password...',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold24,
          ),
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
                  CustomTextFormField(
                    labelText: 'Email',
                    controller: controller,
                  ),
                  Align(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor,
                        padding: const EdgeInsets.all(16.00),
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Text(
                        'Send',
                        style: AppTextStyles.bold12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
