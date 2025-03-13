import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/build_border.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputType = TextInputType.text,
  });
  final String labelText;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType textInputType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.regular16,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return '${widget.labelText} is required';
        } else {
          return null;
        }
      },
      obscureText: widget.labelText == 'Password' ? _isVisible : false,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        label: Text(
          widget.labelText,
          style: const TextStyle(color: AppColors.kGreyColor),
        ),
        labelStyle: AppTextStyles.regular16.copyWith(
          color: AppColors.kGreyColor,
        ),
        suffixIcon:
            widget.labelText == 'Password'
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: Icon(
                    _isVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[800],
                  ),
                )
                : null,
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

