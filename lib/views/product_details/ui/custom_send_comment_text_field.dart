import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/build_border.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/product_details/logic/product_details_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomSendCommentTextField extends StatefulWidget {
  const CustomSendCommentTextField({super.key, required this.productId});
  final String productId;

  @override
  State<CustomSendCommentTextField> createState() =>
      _CustomSendCommentTextFieldState();
}

class _CustomSendCommentTextFieldState
    extends State<CustomSendCommentTextField> {
  TextEditingController commentController = TextEditingController();
  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: commentController,
      style: AppTextStyles.regular14,
      decoration: InputDecoration(
        hintText: 'Type your feedback',
        hintStyle: AppTextStyles.regular14.copyWith(
          color: AppColors.kGreyColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            context.read<ProductDetailsCubit>().addComment(
              comment: commentController.text,
              productId: widget.productId,
            );
          },
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
